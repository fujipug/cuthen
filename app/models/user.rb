class User < ActiveRecord::Base
  has_many :group, through: :group_members
  has_many :itinerary, through: :itin_invited_user
  has_many :event, through: :event_invited_user
  has_many :user_event_vote
end