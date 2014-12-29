class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:index]
   before_action :correct_user,   only: [:edit, :update]
  def index
  	 @users = User.all
     # @friend = current_user.friend
  	 @users = User.order("email").page(params[:page]).per(3)
   end
 
  def new
  end

  def show
  	@user = User.find(params[:id])
     #@microposts = @user.microposts
  end

  def edit
  end

  def update
    # if @user.update_attributes(user_params)
    #   flash[:success] = "Profile updated"
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
  end
  
  def friend
      @user = User.find(params[:id])

      if current_user.has_friend?(@user) 
      friendsuser = FriendsUser.where(user_id: current_user.id, friend_id: @user.id).first
      friendsuser.destroy
      flash[:notice] = "Remove friend"
      
      else
        friendsuser = FriendsUser.new(user_id: current_user.id, friend_id: @user.id)

        if friendsuser.save
          flash[:notice] = "Request Send"
        else
          flash[:alert] = "Unsuccesful"
        end
        #  @friendsuser = current_user.friendsuser.build(friend_id: friend.id)
        # if @friendsuser.save
        #   flash[:notice] = "Added friend."
        #  end 
              
     end
     redirect_to users_show_path
  end
 
  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

