class User < ActiveRecord::Base
  # shows the user has a secure, encrypted password
  has_secure_password

  # can own many posts and replies, both of which are dependent on the user existing 
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  
  # User must have a first and last name
  # also must have a unique email address 
  validates :first_name,
  			presence: true

  validates :last_name,
  			presence: true

  validates :email,
  			presence: true,
  			uniqueness: true,
  			format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  # ensures first name and last name are entered
  def to_s
    "#{first_name} #{last_name}"
  end
end
