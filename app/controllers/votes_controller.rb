class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @votes = Vote.where(event_id: params[:event_id])
    @event = Event.where(id: params[:event_id])
  end

  def show
    @vote = Vote.find(params[:id])
    @event = Event.find(@vote.event_id)
  end

  def new
    @vote = Vote.new
    @event = Event.find(params[:event_id])
    @startday = @event.start_datetime.strftime("%d")
    @endday = @event.end_datetime.strftime("%d")
    @slot = @event.start_datetime
  end

  def edit
    @vote = Vote.new
    @event = Event.find(params[:event_id])
  end

  def create
    #if there's a times array, do the thing for the voting
    #otherwise, just save the choice for First Come First Serve
    if params[:times]
      times = params[:times]
        times.each do |time|
          @vote = Vote.new
          
          #since this whole process is generally fucked up, just gonna set everything by hand
          @vote.start = time
          @event = Event.find(params[:event_id])
          @vote.end_time = @vote.start + @event.duration*60
          @vote.event_id = @event.id
          @vote.user_id = current_user.id
          
          #Makes sure user doesn't end up voting twice or something.  What a terrible thing that would be.
          #Really.
          #Would just mess everything right up. 
          if !Vote.where(user_id: @vote.user_id, event_id: @vote.event_id, start: @vote.start).first
            @vote.save
          end

        end
      redirect_to url_for(:controller => :votes, :action =>'index', :itinerary_id => @event.itinerary_id )
      
      #the first come first serve bit.
    else
      @vote = Vote.new(vote_params)
      @event = Event.find(params[:event_id])
      @vote.event_id = @event.id
      #must manually add an end time if doing the first come first serve
      if !@event.votetype
        @vote.end_time = @vote.start + @event.duration*60
      end
      @vote.user_id = current_user.id
      @event = Event.find(@vote.event_id)
      #event_invited_users = @event.event_invited_users.build
      if @vote.save
        #redirect to events page
        redirect_to url_for(:controller => :events, :action =>'show', :id => @event.id, :itinerary_id => @event.itinerary_id )
      else
        redirect_to url_for(:controller => :votes, :action =>'new', :event_id => @event.id, :itinerary_id => @event.itinerary_id )
        flash[:error] = flash_error_message(@vote)
        #render('new')
      end
    end
  end

  def update
    @vote.update(vote_params)
    respond_with(@vote)
  end

  def destroy
    @vote.destroy
    respond_with(@vote)
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:user_id, :event_id, :start, :end_time)
    end
  
    def flash_error_message(arg)
      "The form contains #{arg.errors.count} error: #{arg.errors.full_messages.join(', ')}"       
    end
end
