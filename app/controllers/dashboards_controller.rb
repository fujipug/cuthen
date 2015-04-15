class DashboardsController < ApplicationController

  def dashboard
    @user = current_user
    all_itineraries = Itinerary.all
    @itineraries = Itinerary.where(user_id: @user.id)
    @itineraries2 = []
		itinerary_invited_users = ItineraryInvitedUser.where(user_id: @user.id)
    itinerary_invited_users.each do |f|
			@itineraries2 += Itinerary.where(id: f.itinerary_id)
    end

    #@itinerary_invited_users = ItineraryInvitedUser.where(user_id: @user.id)
    #
    #@itinerary_invited_users.each do |f|
    	#@itineraries2 += Itinerary.where(id: f.itinerary_id)
		#end
    #@itineraries2 = Itinerary.where(id: @itinerary_invited_users[0])
    @invitations = EventInvitedUser.where(user_id: @user.id)
    #@events = Event.where(id: @invitations.event_id).find_each
  end
end