class Itinerary < ActiveRecord::Base
  has_many :events
  has_many :groups, through :itin_invited_group
  has_many :user, through :event_invited_group
  
end
