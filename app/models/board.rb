class Board < ActiveRecord::Base
  has_many :topics
  has_many :posts, through: :topics
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }

  scope :interests, -> { where(category: "Interests") }
  scope :creative, -> { where(category: "Creative") }
  scope :other, -> { where(category: "Other") }
end
