class NotificationController < ApplicationController
    def stats
      @invitations = FriendsUser.where(friend_id: current_user.id)
    end

    def friend_request_accept
      friendsuser = FriendsUser.where(user_id: current_user.id, friend_id: user.id).first
      friendsuser.update_attributes(accepted: true)
    end
    
    def friend_request_reject
      friendsuser = FriendsUser.where(user_id: current_user.id, friend_id: user.id).first
      friendable.destroy
    end
end 
