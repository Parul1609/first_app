class User < ActiveRecord::Base
  has_many :ideas,    dependent: :destroy
  has_many :comments, foreign_key: "commenter_id", class_name: "Comment"
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

  
end