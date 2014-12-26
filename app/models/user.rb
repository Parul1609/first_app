class User < ActiveRecord::Base
  has_many :ideas,    dependent: :destroy, through: :likes
  has_many :comments, foreign_key: "commenter_id", class_name: "Comment"
  has_many :likes
  # has_many :friends, foreign_key: "friend_id", class_name: "Comment"

  has_many :friend, :through => :friendsusers
  
   belongs_to :friendsuser
  

  # has_many :friends, :through => :friends_user

      #  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    #include Gravtastic
    #   gravtastic
    # paginates_per 5
    # has_many :friendship
  # has_many :users, through: :friendships
    # include Amistad::FriendModel

  def has_liked? idea
    Like.where(idea_id: idea.id, user_id: self.id).first
  end

 # def friend(other_user)
 #    active_friends_users.create(friend_id: other_user.id)
 #  end

 #  # Unfriend a user.
 #  def unfriend(other_user)
 #    active_friends_users.find_by(friend_id: other_user.id).destroy
 #  end

  # Returns true if the current user is friend the other user.
  def has_friend? user
    FriendsUser.where(user_id: self.id, friend_id: user.id).first
  end
  # def has_request? current_user
  #   FriendsUser.where(user_id: user.id, friend_id: self.id).first
  # end
end