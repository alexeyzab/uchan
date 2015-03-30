class Post < ActiveRecord::Base
  belongs_to :board
  belongs_to :topic
  validates :post_title, length: { maximum: 140 }
  validates :post_description, presence: true, length: { maximum: 500 }
end
