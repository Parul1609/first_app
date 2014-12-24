class User < ActiveRecord::Base
  has_many :ideas,    dependent: :destroy, through: :likes
  has_many :comments, foreign_key: "commenter_id", class_name: "Comment"
  has_many :likes
  # has_many :friends, foreign_key: "friend_id", class_name: "Comment"

  has_many :friends_users
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
# has_many :friends, :through => :friends_users, :conditions => "status = 'accepted'"
# has_many :requested_friends, :through => :friends_users, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
# has_many :pending_friends, :through => :friends_users, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
# has_many :friends_users, :dependent => :destroy
end