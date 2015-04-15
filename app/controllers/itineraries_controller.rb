class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:name, :description, :duration, :startdate, :enddate]

  respond_to :json
  def calendar_data
    @events = Event.all
    @itineraries = Itinerary.all
    respond_to do |format|
      format.json { render json: @itineraries.as_json + @events.as_json }
    end
  end

  respond_to :json
  def calendar_data2
    @itinerary = Itinerary.where(id: params[:id])
    @events = Event.where(itinerary_id: params[:id])
    #@itineraries = Itinerary.all
    respond_to do |format|
      format.json { render json: @itinerary.as_json + @events.as_json }
    end
  end

  respond_to :json
  def calendar_data3
    @event = Event.find(params[:event_id])
    #@itineraries = Itinerary.all
    respond_to do |format|
      format.json { render json: @event.as_json }
    end
  end
  
  def determine_time
    @itinerary = Itinerary.find(params[:itinerary_id])
    @user = current_user
    event = Event.where(itinerary_id: @itinerary.id).first
    #@events.each do |event|
      if event.votetype?
        #do the pick best time thing
        @votes = Vote.where(event_id: event.id).find_each
        @chosen_vote = @votes.first
        @times_voted = 0
        @votes.each do |vote|
          #for each vote, check start time, count how many times it's in the list of votes
          #the start time with the most votes wins.  In the event of a tie, the earlier time wins.
          #NEEDS TO EVENTUALLY TAKE INTO PREVIOUS EVENT TIMES
          #Here it goes... may the lord have mercy on our souls.
          @times = 0
          @votes.each do |avote|
            if vote.start == avote.start
              @times += 1
            end
          end
          
          if @times>@times_voted
            @times_voted = @times
            @chosen_vote = vote
          end 
          
        end
      else
        #do the first come first serve thing
      end
    #end
    flash[:notice] = @chosen_vote.start
    redirect_to(:action => 'show', :id => @itinerary.id)
  end  


  def index
    @itineraries = Itinerary.all
    @users = User.all
  end


  def show
    @itinerary = Itinerary.find(params[:id])
    @user = User.find(@itinerary.user_id)
    @events = Event.where "itinerary_id like ?", "%#{params[:id]}%"
    @allevent = Event.find_by "itinerary_id like ?", "%#{params[:id]}%"
  end


  def new
    @itinerary = Itinerary.new
    itinerary_invited_users = @itinerary.itinerary_invited_users.build
  end
  

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id
    if @itinerary.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @itinerary_invited_users = ItineraryInvitedUser.where "itinerary_id like ?", "%#{params[:id]}%"
    @users ||= Array.new
    @itinerary_invited_users.each do |itinerary_invited_user|
      @users.push(User.find_by(id: itinerary_invited_user.user_id))
    end
  end
  
  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update_attributes(itinerary_params)
      redirect_to(:action => 'show', :id => @itinerary.id)
    else
      render('index')
    end
  end
  
  def delete
    @itinerary = Itinerary.find(params[:id])
  end
  
  def destroy
    Itinerary.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
  
private
  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:name, :user_id, 
      :description, :startdate, :enddate, itinerary_invited_users_attributes: [:id, :itinerary_id, :user_id])
  end
end