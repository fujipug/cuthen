class Group < ActiveRecord::Base
  belongs_to :user
  has_many :group_members
  has_many :users, through: :group_members
  has_many :event, through: :event_group_invite
  has_many :itinerary, through: :itin_group_invite
end