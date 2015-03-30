class Topic < ActiveRecord::Base
  belongs_to :board
  has_many :posts
  validates :topic_name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
end
