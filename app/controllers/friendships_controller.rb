class FriendshipsController < ApplicationController
# before_filter :login_required, :except => [:index, :show]

# def index
# @user = User.find(params[:user_id])
# end

# def show
# redirect_to user_path(params[:id])
# end

# def new
# @friends_users1 = Friends_users.new
# @friends_users2 = Friends_users.new
# end

# def create
# @user = User.find(current_user)
# @friend = User.find(params[:friend_id])
# params[:friends_users1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
# params[:friends_users2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}
# @friends_users1 = Friends_users.create(params[:friends_users1])
# @friends_users2 = Friends_users.create(params[:friends_users2])
# if @friends_users1.save && @friends_users2.save
# redirect_to user_friends_path(current_user)
# else
# redirect_to user_path(current_user)
# end
# end

# def update
# @user = User.find(current_user)
# @friend = User.find(params[:id])
# params[:friends_users1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'accepted'}
# params[:friends_users2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'accepted'}
# @friends_users1 = Friends_users.find_by_user_id_and_friend_id(@user.id, @friend.id)
# @friends_users2 = Friends_users.find_by_user_id_and_friend_id(@friend.id, @user.id)
# if @friends_users1.update_attributes(params[:friends_users1]) && @friends_users2.update_attributes(params[:friends_users2])
# flash[:notice] = 'Friend sucessfully accepted!'
# redirect_to user_friends_path(current_user)
# else
# redirect_to user_path(current_user)
# end
# end

# def destroy
# @user = User.find(params[:user_id])
# @friend = User.find(params[:id])
# @friends_users1 = @user.friends_users.find_by_friend_id(params[:id]).destroy
# @friends_users2 = @friend.friends_users.find_by_user_id(params[:id]).destroy
# redirect_to user_friends_path(:user_id => current_user)
# end


   # before_filter :authenticate_user!

  # def index
  #   @friends = current_user.friends
  # end

  # def new
  #   @users = User.all :conditions => ["id != ?", current_user.id]
  # end

  # def create
  #   invitee = User.find_by_id(params[:user_id])
  #   if current_user.invite invitee
  #     redirect_to new_friend_path, :notice => "Successfully invited friend!"
  #   else
  #     redirect_to new_friend_path, :notice => "Sorry! You can't invite that user!"
  #   end
  # end

  # def update
  #   inviter = User.find_by_id(params[:id])
  #   if current_user.approve inviter
  #     redirect_to new_friend_path, :notice => "Successfully confirmed friend!"
  #   else
  #     redirect_to new_friend_path, :notice => "Sorry! Could not confirm friend!"
  #   end
  # end

  # def requests
  #   @pending_requests = current_user.pending_invited_by
  # end

  # def invites
  #   @pending_invites = current_user.pending_invited
  # end

  # def destroy
  #   user = User.find_by_id(params[:id])
  #   if current_user.remove_friendship user
  #     redirect_to friends_path, :notice => "Successfully removed friend!"
  #   else
  #     redirect_to friends_path, :notice => "Sorry, couldn't remove friend!"
  #   end
  # end
end
