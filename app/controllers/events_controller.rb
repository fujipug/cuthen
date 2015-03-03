class EventsController < ApplicationController
  before_action :set_event, only: [:name, :descrption, :duration, :startdate, :enddate, :deadlinedate]

  def index
    @events = Event.all
    @itineraries = Itinerary.all
    #@event_invited_user = EventInvitedUser.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    #@nested_form_index = 0;
    @event = Event.new
    event_invited_users = @event.event_invited_users.build
    event_invited_users = @event.event_invited_users.build
    event_invited_users = @event.event_invited_users.build
  end
  
  def create
    @event = Event.new(event_params)
    event_invited_users = @event.event_invited_users.build
    if @event.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to(:action => 'show', :id => @event.id)
    else
      render('index')
    end
  end
  
  def delete
    @event = Event.find(params[:id])
  end
  
  def destroy
    Event.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
  
private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :itinerary_id, 
      :description, :duration, :startdate, :enddate, 
      :deadlinedate, event_invited_users_attributes: [:id, :event_id, :user_id])
  end
end