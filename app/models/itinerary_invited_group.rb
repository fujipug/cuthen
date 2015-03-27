class ItineraryInvitedGroup < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :group
end