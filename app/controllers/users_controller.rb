class UsersController < ApplicationController
  respond_to :html, :json
  def typeahead
  	@users = User.order(:name).where "name like ?", "%#{params[:term]}%"
  	#@tests.map(&:name) ==> @users.map{|x| x.name}
  	#render json: @users.map{|x| x.id.to_s}
    #render json: @users.to_json(include: {})
    respond_to do |format|
      format.json { render json: @users.as_json }
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end