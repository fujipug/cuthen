class DashboardsController < ApplicationController

  def dashboard
    @user = current_user
    @event = Event.first  #fix this
    #@itinerary = Itinerary.find(@event.itinerary_id)
  end
end
