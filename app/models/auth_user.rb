#class AuthUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 # devise :database_authenticatable, :registerable,
 #        :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

#def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
#  	data = access_token.info
#  	auth_user = User.where(:email => data["email"]).first
#	end 

#	def self.new_with_session(params, session)
#    super.tap do |auth_user|
#  		if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
#    		auth_user.email = data["email"] if auth_user.email.blank?
#  		end
#  	end
#  end    
#end