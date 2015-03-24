class SearchController < ApplicationController
  
  respond_to :json
  def user_data
  	@users = User.order(:name).where "name like ?", "%#{params[:user]}%"
  	#@tests.map(&:name) ==> @users.map{|x| x.name}
  	#render json: @users.map{|x| x.id.to_s}
    #render json: @users.to_json(include: {})
    respond_to do |format|
      format.json { render json: @users.as_json }
    end
  end

  def itinerary_data
  end

  def index
  	@users = User.all#User.order(:name).where "name like ?", "%#{params[:user_name]}%"
  	@itineraries = Itinerary.all#Itinerary.order(:name).where "name like ?", "%#{params[:itinerary_name]}%"
  end

  def results
		@users = User.order(:name).where "name like ?", "%#{params[:user]}%"
  	@itineraries = Itinerary.order(:name).where "name like ?", "%#{params[:itinerary_name]}%"
  end
end
