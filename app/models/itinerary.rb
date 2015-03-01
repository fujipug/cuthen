class Itinerary < ActiveRecord::Base
  has_many :events
  has_many :groups, through: :itin_invited_group
  #has_many :user, through: :itin_invited_user
  
  def endtime_string
  	endtime.strftime("%m/%d/%Y")
  end

  def endtime_string=(end_str)
  	self.endtime = DateTime.strptime(end_str, "%m/%d/%Y")
  end
end