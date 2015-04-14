class User < ActiveRecord::Base
  has_many :groups
  has_many :groups_memberships, :class_name => 'Group', through: :group_members
  has_many :itinerary, through: :itin_invited_user
  has_many :event, through: :event_invited_user
  has_many :user_event_vote
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first
      #return user if user
      # Uncomment the section below if you want users to be created if they don't exist
      unless user
      user = User.create(name: data["name"],
              email: data["email"],
              image: omniauth.info.image,
              password: Devise.friendly_token[0,20]
           )
      end
      user
  end

  def updated_at_string()
    updated_at.try(:strftime, "%m/%d/%Y %I:%M %p")
  end
  #def as_json(options={})
  #  {value: name.to_s, name: }
  #end

end