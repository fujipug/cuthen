class EventsController < ApplicationController
  def index
    @events = Event.all
    @itineraries = Itinerary.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

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
  def event_params
    params.require(:event).permit(:name, :itinerary_id, :description, :duration, :startdate, :enddate, :deadlinedate)
  end
end