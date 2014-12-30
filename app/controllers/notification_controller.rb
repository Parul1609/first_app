class NotificationController < ApplicationController
    def stats
      @invitations = FriendsUser.where(friend_id: current_user.id)
    end

    def friend_request_accept
      friendsuser = FriendsUser.where(user_id: params[:user_id], friend_id: params[:friend_id]).first
      friendsuser.update_attributes(accepted: true)
      redirect_to notification_stats_path
    end

    def friend_request_reject
      friendsuser = FriendsUser.where(user_id: params[:user_id], friend_id: params[:friend_id]).first
      friendsuser.destroy
      redirect_to notification_stats_path
    end
    

end 
