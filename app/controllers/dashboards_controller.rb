class DashboardsController < ApplicationController

  def dashboard
    @user = current_user
    @invitations = EventInvitedUser.where(user_id: @user.id) 
    #@events = Event.where(id: @invitations.event_id).find_each
  end
end
