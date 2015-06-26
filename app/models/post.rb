class Post < ActiveRecord::Base
  belongs_to :board
  belongs_to :topic
  validates :post_title, length: { maximum: 140 }
  validates :post_description, presence: true, length: { maximum: 500 }
  has_attached_file :post_image, :styles => { :medium => "300x300>", :thumb =>
                                              "125x125>" }
  validates_attachment_content_type :post_image, :content_type => /\Aimage/
  validates_attachment_file_name :post_image, :matches => [/png\Z/, /gif\Z/,
                                                           /jpe?g\Z/, /JPG\Z/]
end
