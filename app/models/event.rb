class Event < ActiveRecord::Base
  belongs_to :itinerary
  has_many :group, through: :event_invited_group
  has_many :user, through: :event_invited_user
  has_many :event_invited_users, dependent: :destroy
  has_many :event_time_range, dependent: :destroy
  accepts_nested_attributes_for :event_invited_users, reject_if: :reject_invited_user, allow_destroy: true

  def reject_invited_user(attributes)
    exists = attributes['id'].present?
    empty = attributes[:user_id].blank?# || attributes[:where].blank?
    attributes.merge!({:_destroy => 1}) if exists and empty
    return (!exists and empty)
  end
  
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
    {title: name, start: start_datetime, end: end_datetime}
  end
end
