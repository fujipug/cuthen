class ItineraryInvitedUser < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :user
end