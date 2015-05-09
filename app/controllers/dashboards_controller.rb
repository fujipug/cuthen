class DashboardsController < ApplicationController

  def dashboard
    @user = current_user
    #get itineraries
    #ones created by signed in user
    @itineraries = Itinerary.where(user_id: @user.id)
    #then ones that the current user is involved in
    @itineraries2 = []
		itinerary_invited_users = ItineraryInvitedUser.where(user_id: @user.id)
    itinerary_invited_users.each do |f|
			@itineraries2 += Itinerary.where(id: f.itinerary_id)
    end
    #then the events of both
    @events = []
    @itinerary_event_count = []
    @events2 = []
    @itinerary_event_count2 = []
    @itineraries.each do |f|
			current_events = Event.where(itinerary_id: f.id)
			@itinerary_event_count.push(current_events.length)
			@events += current_events
    end
    @itineraries2.each do |f|
			current_events = Event.where(itinerary_id: f.id)
			@itinerary_event_count2.push(current_events.length)
			@events2 += current_events
    end
    @events3 = []
    event_invited_users = EventInvitedUser.where(user_id: current_user.id)
    event_invited_users.each do |f|
      @events3 += Event.where(id: f.event_id)
    end
    #@itinerary_invited_users = ItineraryInvitedUser.where(user_id: @user.id)
    
    #@itinerary_invited_users.each do |f|
    	#@itineraries2 += Itinerary.where(id: f.itinerary_id)
		#end
    #@itineraries2 = Itinerary.where(id: @itinerary_invited_users[0])
    @invitations = EventInvitedUser.where(user_id: @user.id)
    #@events = Event.where(id: @invitations.event_id).find_each
  end
end