class Article < ActiveRecord::Base
	#Not used anymore - replaced with posts 
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
end
