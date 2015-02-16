class Group < ActiveRecord::Base
  belongs_to :user
  has_many :user, through :group_members
end
