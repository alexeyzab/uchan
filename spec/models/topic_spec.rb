require "rails_helper"

describe Topic, :type => :model do
  it { should belong_to(:board) }
  it { should validate_presence_of(:thread_name) }
  it { should validate_length_of(:thread_name).
       is_at_most(100) }
  it { should validate_length_of(:description).
       is_at_most(500) }
  it { should validate_presence_of(:topic_image) }
  it { should validate_attachment_content_type(:topic_image).
       allowing('image/png', 'image/gif', 'image/jpg').
       rejecting('text/plain', 'text/xml') }

  describe ".last_five_posts" do
    it "shows the last five posts for each topic" do
      topic = create(:topic)
      last_five_posts = 5.times do
        create(:post, post_description: "Hi there", topic: topic)
      end

      posts = topic.last_five_posts

      expect(posts.count).to eq(last_five_posts)
    end
  end
end
