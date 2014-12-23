class Comment < ActiveRecord::Base
	belongs_to :idea
	belongs_to :commenter, class_name: "User", foreign_key: "commenter_id"
end
