class Idea < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	has_many :comments, dependent: :destroy
	has_many :likes
	belongs_to :user
end
