class EventInvitedUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def datetime_to_datestring(datetime)
  	datetime.try(:strftime, "%m/%d/%Y %I:%M %p")
  end
end