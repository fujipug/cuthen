class UsersController < ApplicationController
  respond_to :json
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

  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path
    else
      render('index')
    end
  end

  def user_params
    params.require(:user).permit(:name, :title, :email, :work)
  end

end