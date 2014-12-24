class Like < ActiveRecord::Base
	belongs_to :users
	belongs_to :idea

end
