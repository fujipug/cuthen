class VisitorsController < ApplicationController
  def welcome
    
  end
  
  def index
    x = 2
    if x == 3

      render(:template => 'dashboards/dashboard')
    else
      render :layout => "welcome"
    end
  end
end  
