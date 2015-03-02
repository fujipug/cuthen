class Itinerary < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :groups, through: :itin_invited_group
  has_many :user, through: :itin_invited_user
  belongs_to :owner #user that owns of itinerary
  #accepts_nested_attributes_for :events

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
end