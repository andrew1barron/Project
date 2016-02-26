class Post < ActiveRecord::Base
  has_many :replies, dependent: :destroy
  belongs_to :user

  validates :title,
            presence: true

  validates :content,
            presence: true

  validates :user,
            presence: true
            
  def to_s
    title
  end
end
