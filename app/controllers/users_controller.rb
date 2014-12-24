class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:index]
   before_action :correct_user,   only: [:edit, :update]
  def index
  	 @users = User.all
  	 @users = User.order("email").page(params[:page]).per(2)
   end
 
  def new
  end

  def show
  	@user = User.find(params[:format])
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

