class VisitorsController < ApplicationController
  def welcome
    
  end
  def index
  	#@user_id = current_user.id
    render :layout => "welcome"
  end
end  
