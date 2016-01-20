class Topic < ActiveRecord::Base
  before_create :delete_last_topic
  paginates_per 10

  belongs_to :board
  has_many :posts
  validates :topic_name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :topic_image, presence: true
  has_attached_file :topic_image, :styles => { :medium => "300x300>", :thumb =>
                                              "125x125>" }
  validates_attachment_content_type :topic_image, :content_type => /\Aimage/
  validates_attachment_file_name :topic_image, :matches => [/png\Z/, /gif\Z/,
                                                           /jpe?g\Z/, /JPG\Z/]

  scope :bump_order, -> { order("updated_at DESC") }

  def last_five_posts
    Post.where(topic_id: self.id).last(5)
  end

  def bumplimit?
    posts.count > 499
  end

  private

  def delete_last_topic
    board = Board.find(self.board_id)
    if board.topics.count == 50
      board.topics.bump_order.last.destroy
    else
      true
    end
  end
end
