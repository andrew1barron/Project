class Comment < ActiveRecord::Base
	#not used anymore - replaced with replies 	
  belongs_to :article
end
