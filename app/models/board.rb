class Board < ActiveRecord::Base
  has_many :topics
  has_many :posts, through: :topics
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
end
