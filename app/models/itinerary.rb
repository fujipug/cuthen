class Itinerary < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :groups, through: :itin_invited_group
  has_many :user, through: :itin_invited_user
  belongs_to :owner #user that owns of itinerary
  #accepts_nested_attributes_for :events

  #these are for testing the autocomplete forms
  def test_name
    #test.try(:name)
  end
  def test_name=(name)
    #self.test = Test.find_by_name(name) if name.present?
  end
  #autocomplete forms end

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