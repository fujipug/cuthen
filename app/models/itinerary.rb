class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :groups, through: :itinerary_invited_group
  #has_and_belongs_to_many :user, through: :itin_invited_user
  has_many :itinerary_invited_users, dependent: :destroy
  accepts_nested_attributes_for :itinerary_invited_users, reject_if: :reject_invited_user, allow_destroy: true

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

  def figure_out_best_times(array_of_times)
    #first, sort the array of votes (array_of_times) so that it's in order of start time
    #since it's just an array, we can't user .order
    
    @best_votes = []
    @event_order = []
    #for each vote, build an array of times and events that lead to the greatest number of events included
    array_of_times 
    #select the first time
    event_ids = []
    #event_ids.push array_of_times[0].event_id
    sort, ees = best_time_helper(array_of_times, array_of_times[0], 0, event_ids, [])
    return sort, ees
  end
  
  def best_time_helper(array_of_times, vote, vote_position, event_ids, votes)
    event_ids.push  vote.event_id
    if vote_position==array_of_times.length or vote.end_time > array_of_times[-1].start
      return vote, event_ids
    else
      next_vote = vote
      while vote_position < array_of_times.length
        #if the next event comes after the current event and the event hasn't been included yet
        if next_vote.start >= vote.end_time and !vote.event_id.in?(event_ids)
          event_ids.push next_vote.event_id
          votes.push best_time_helper(array_of_times, next_vote, vote_position, event_ids, votes)
        end
        vote_position += 1
        next_vote = array_of_times[vote_position]
      end
    end
 
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

  def as_json(options={})
    {id: "itinerary_#{id}", start: start_datetime, end: end_datetime, rendering: 'background', color: color}
  end
end