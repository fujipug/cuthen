class Group < ActiveRecord::Base
  belongs_to :user
  has_many :user, through: :group_members
  has_many :event, through: :event_group_invite
  has_many :itinerary, through: :itin_group_invite
end