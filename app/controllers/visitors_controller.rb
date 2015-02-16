class VisitorsController < ApplicationController
  def welcome
  end
  
  def index
    x = 3
    if x == 3
      render :layout => "welcome"
    else
      render :layout => "application"
    end
  end
end  
