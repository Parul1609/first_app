class User < ActiveRecord::Base
	  has_many :ideas,    dependent: :destroy
has_many :comments
	  #  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#include Gravtastic
	#	gravtastic
	# paginates_per 5
	end