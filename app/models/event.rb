class Event < ActiveRecord::Base
  belongs_to :itinerary
  has_many :group, through: :event_invited_group
  #has_many :user, through: :event_invited_user
  has_many :event_invited_users, dependent: :destroy
  has_many :event_time_range, dependent: :destroy
  accepts_nested_attributes_for :event_invited_users, reject_if: :reject_invited_user, allow_destroy: true

  def reject_invited_user(attributes)
    exists = attributes['id'].present?
    empty = attributes[:user_id].blank?# || attributes[:where].blank?
    attributes.merge!({:_destroy => 1}) if exists and empty
    return (!exists and empty)
  end
  
  #these are for testing the autocomplete forms
  def invite_user_name
    #test.try(:name)
  end
  def invite_user_name=(name)
    #self.test = Test.find_by_name(name) if name.present?
  end
  #autocomplete forms end
  
  def select_winning_votes
    best_times = []
    invited_users = EventInvitedUser.where(event_id: self.id)
    number_of_guests = 0
    invited_users.each do |invited|
      number_of_guests += 1
    end

    #the voting type of event
    if self.votetype?

      @votes = Vote.where(event_id: self.id).order(:start).find_each
      @votes.each do |vote|
        times_voted_on = 0
        chosen_vote = vote
        @votes.each do |comparevote|
          if vote.start = comparevote.start
            times_voted_on +=1
          end
        end

        if times_voted_on = number_of_guests #if everyone agrees on the time
          best_times.push vote
        end
      end

      #the first come first serve type of event
    else
      #uhhhhhhhhhhhh
    end
    return best_times
  end
  
  def datetime_to_datestring(datetime)
  	datetime.try(:strftime, "%m/%d/%Y %I:%M %p")
  end

  def string_to_datetime(string)
  	DateTime.strptime(string, "%m/%d/%Y %I:%M %p")
  end

  def startdate
  	datetime_to_datestring(start_datetime)
  end

  def startdate=(start_datestring)
  	self.start_datetime = string_to_datetime(start_datestring)
  end

  def enddate
  	datetime_to_datestring(end_datetime)
  end

  def enddate=(end_datestring)
  	self.end_datetime = string_to_datetime(end_datestring)
  end

  def deadlinedate
  	datetime_to_datestring(deadline_datetime)
  end

  def deadlinedate=(deadline_datestring)
  	self.deadline_datetime = string_to_datetime(deadline_datestring)
  end

  def as_json(options={})
    {id: id, title: name, start: start_datetime, end: end_datetime, constraint: "itinerary_#{itinerary_id}", color: color}
  end
end