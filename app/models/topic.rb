class Topic < ActiveRecord::Base
  belongs_to :board
  has_many :posts
  validates :thread_name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }

  def last_five_posts
    Post.where(:topic_id => self.id).last(5)
  end
end
