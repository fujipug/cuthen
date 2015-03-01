class ItinInvitedGroup < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :group
end