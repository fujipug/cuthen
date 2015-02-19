class Event < ActiveRecord::Base
  belongs_to :itinerary
  has_many :group, through :event_invited_group
  has_many :user, through :event_invited_user
  has_many :event_time_range
end
