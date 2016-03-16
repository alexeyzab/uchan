class Board < ActiveRecord::Base
  has_one :catalog
  has_many :topics
  has_many :posts, through: :topics
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :slug, presence: true

  scope :interests, -> { where(category: "Interests") }
  scope :creative, -> { where(category: "Creative") }
  scope :other, -> { where(category: "Other") }

  def to_param
    slug
  end
end
