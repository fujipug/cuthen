class Event < ActiveRecord::Base
  belongs_to :itinerary
  has_many :group, through: :event_invited_group
  has_many :user, through: :event_invited_user
  has_many :event_time_range

  def datetime_to_datestring(datetime)
  	datetime.try(:strftime, "%m/%d/%Y")
  end

  def string_to_datetime(string)
  	DateTime.strptime(string, "%m/%d/%Y")
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

  def enddate=(deadline_datestring)
  	self.end_datetime = string_to_datetime(end_datestring)
  end

  def deadlinedate
  	datetime_to_datestring(deadline_datetime)
  end

  def deadlinedate=(deadline_datestring)
  	self.end_datetime = string_to_datetime(deadline_datestring)
  end
end
