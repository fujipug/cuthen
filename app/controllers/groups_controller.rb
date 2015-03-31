class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
  	# show all the groups
  	@groups = current_user.groups
  end

  def show
     # show one group
     @group = Group.find(params[:id])
     user_ids = GroupMember.where(:group_id => params[:id]).pluck(:user_id)
     @members = User.where(:id => user_ids)
  end

  def new
   	 @group = Group.new
  end

  def create
     @group = Group.create(group_params)
     @group.user = current_user
     @group.save!
     redirect_to groups_path
  end

  def edit
  	@group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update!(group_params)
  	redirect_to @group
  end

  def destroy
  	#delete a group
  end

 private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def group_params
      params.require(:group).permit(:name, :description)
    end
 

end
