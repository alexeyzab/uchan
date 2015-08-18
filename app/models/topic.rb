class Topic < ActiveRecord::Base
  after_create :delete_last_topic

  belongs_to :board
  has_many :posts
  validates :thread_name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :topic_image, presence: true
  has_attached_file :topic_image, :styles => { :medium => "300x300>", :thumb =>
                                              "125x125>" }
  validates_attachment_content_type :topic_image, :content_type => /\Aimage/
  validates_attachment_file_name :topic_image, :matches => [/png\Z/, /gif\Z/,
                                                           /jpe?g\Z/, /JPG\Z/]

  scope :order_topics, -> { includes(:posts).order("posts.created_at DESC") }

  def last_five_posts
    Post.where(:topic_id => self.id).last(5)
  end

  private

  def delete_last_topic
    board = Board.find(self.board_id) if Board.any?
    if board.topics.count > 50
      board.topics.order_topics.last.destroy
    end
  end
end
