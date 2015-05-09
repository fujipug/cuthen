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
    #select the first time
    event_ids = []
    #event_ids.push array_of_times[0].event_id
    #sort, ees = best_time_helper(array_of_times, array_of_times[0], 0, event_ids, [])
    sort = temp_best_time_helper(array_of_times)
    return sort
  end
  
  def temp_best_time_helper(array_of_times)
    best_times = [] #holds the final result
    time_array = [] #holder of times, best version will be put in best_times.  This holds votes
    event_array = [] #holds the events that are included in the time_array. This holds events

    
    # order events by start time
    array_of_times.sort! { |a,b| a.start <=> b.start }
    #then do a terribly inefficient algorithm
    
    #start
    for outer in 0..array_of_times.length-1 do
      time_array = []
      event_array = []
      time_array.push array_of_times[outer] #push the first
      event_array.push array_of_times[outer].event_id
      
      for inner in outer+1..array_of_times.length-1 do
        if time_array[-1].end_time > array_of_times[inner].start #if the next event starts before the last
          next
        end
  
        if event_array.include?(array_of_times[inner].event_id) #if the event has already been used
          next
        end
        
        time_array.push array_of_times[inner]
        event_array.push array_of_times[inner].event_id
      end  
      if time_array.length > best_times.length
        best_times = time_array
      end
    end
    
    return best_times
  end
  
  def datetime_to_datestring(datetime)
  	datetime.try(:strftime, "%m/%d/%Y %I:%M %p")
  end

  def string_to_datetime(string)
    if string == nil || string == ""
      "no date"
    else
      DateTime.strptime(string, "%m/%d/%Y %I:%M %p")
    end
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
    if (options[:editable] != nil)
      editable = options[:editable]
    else
      editable = true
    end
    if start_datetime == nil || end_datetime == nil
      {id: "itinerary_#{id}", start: updated_at, end: updated_at, rendering: 'background', color: color, editable: editable}
    else
      {id: "itinerary_#{id}", start: start_datetime, end: end_datetime, rendering: 'background', color: color, editable: editable}
    end
  end
end