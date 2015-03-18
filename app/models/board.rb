class Board < ActiveRecord::Base
  has_many :topics
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
end
