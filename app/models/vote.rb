class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validate :start, presense: true
  validate :end_time, presense: true
  validate :end_cannot_come_before_start, :starts_not_before_event, :time_range_less_than_duration
  
  
  def end_cannot_come_before_start
    if end_time < start
      errors.add(:end_time, "Invalid Time Range")
    end
  end
  
  def starts_not_before_event
    if start < Event.find(event_id).start_datetime
      errors.add(:start, "time too early")
    end
  end
  
  def starts_not_after_event
    if start > Event.find(event_id).end_datetime
      errors.add(:start, "time too late")
    end
  end
    
  def time_range_less_than_duration
    if (end_time - start) < Event.find(event_id).duration*60
      errors.add(:end_time, "Time span not long enough")
    end
  end
  
  def datetime_to_datestring(datetime)
  	datetime.try(:strftime, "%m/%d/%Y %I:%M %p")
  end

  def string_to_datetime(string)
  	DateTime.strptime(string, "%m/%d/%Y %I:%M %p")
  end

  def startdate
  	datetime_to_datestring(start)
  end

  def startdate=(start_datestring)
  	self.start_datetime = string_to_datetime(start)
  end

  def enddate
    datetime_to_datestring(end_time)
  end

  def enddate=(end_datestring)
    self.end_datetime = string_to_datetime(end_time)
  end

  def as_json(options={})
    {start: start, end: end_time}
  end
end
