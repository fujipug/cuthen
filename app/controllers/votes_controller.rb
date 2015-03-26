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
  end

  def edit
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.event_id = params[:event_id]
    @vote.user_id = current_user.id
    @event = Event.find(@vote.event_id)
    #event_invited_users = @event.event_invited_users.build
    if @vote.save
      #redirect to events page
      redirect_to url_for(:controller => :events, :action =>'show', :id => @event.id, :itinerary_id => @event.itinerary_id )
    else
      render('new')
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
      params.require(:vote).permit(:user_id, :event_id, :start, :end)
    end
end
