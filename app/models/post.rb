class Post < ActiveRecord::Base
  # Post has many replies which are destroyed if the post is destroyed 
  # Post belongs to a given user 
  has_many :replies, dependent: :destroy
  belongs_to :user

  # Must have a title, content and a user associated with them 
  validates :title,
            presence: true

  validates :content,
            presence: true

  validates :user,
            presence: true
  # Ensures the comment has a title      
  def to_s
    title
  end
end
