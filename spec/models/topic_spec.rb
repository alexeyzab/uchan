require "rails_helper"

describe Topic, :type => :model do
  it { should belong_to(:board) }
  it { should validate_presence_of(:topic_name) }
  it { should validate_length_of(:topic_name).
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
      posts = create_list(:post, 5, topic: topic)

      expect(topic.last_five_posts).to eq(posts)
    end
  end

  describe ".bumplimit?" do
    it "returns true if the topic has 500 posts" do
      topic = create(:topic)
      allow(topic).to receive_message_chain(:posts, :count).and_return(500)

      expect(topic.bumplimit?).to eq true
    end
  end

  describe ".delete_last_topic" do
    it "gets called before saving the record" do
      topic = build(:topic)
      allow(topic).to receive(:delete_last_topic)

      topic.save

      expect(topic).to have_received(:delete_last_topic)
    end
  end
end
