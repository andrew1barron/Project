class Reply < ActiveRecord::Base
	# Indicates that a reply belongs to both a post and user 
  belongs_to :post
  belongs_to :user
 
end
