class User < ActiveRecord::Base
  has_many :group, through :group_members
end
