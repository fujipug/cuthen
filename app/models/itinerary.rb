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