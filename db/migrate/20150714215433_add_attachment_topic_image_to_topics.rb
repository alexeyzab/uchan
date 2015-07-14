class AddAttachmentTopicImageToTopics < ActiveRecord::Migration
  def self.up
    add_attachment :topics, :topic_image
  end

  def self.down
    remove_attachment :topics, :topic_image
  end
end
