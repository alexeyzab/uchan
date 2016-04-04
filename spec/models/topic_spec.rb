require "rails_helper"

describe Topic, :type => :model do
  it { should validate_attachment_presence(:topic_image) }
  it { should validate_attachment_content_type(:topic_image).
       allowing("image/png", "image/gif", "image/jpg").
       rejecting("text/plain", "text/xml") }

  it "has proper attributes" do
    topic = build(:topic)

    expect(topic).to be_valid
  end

  it "can't be created with wrong attributes" do
    topic = build(:topic, topic_name: nil, topic_image: nil)

    expect(topic).to be_invalid
    expect(topic.errors[:topic_name]).to eq(["can't be blank"])
    expect(topic.errors[:topic_image]).to eq(["can't be blank"])
  end

  it "has the proper topic_name length" do
    topic = build(:topic, topic_name: "#{'a' * 101}")

    expect(topic).to be_invalid
  end

  it "has the proper description length" do
    topic = build(:topic, description: "#{'a' * 501}")

    expect(topic).to be_invalid
  end

  describe "#last_five_posts" do
    it "shows the last five posts for each topic" do
      topic = create(:topic)
      posts = create_list(:post, 5, topic: topic)

      expect(topic.last_five_posts).to eq(posts)
    end
  end

  describe "#bumplimit?" do
    it "returns true if the topic has 500 posts" do
      topic = create(:topic)
      allow(topic).to receive_message_chain(:posts, :count).and_return(500)

      expect(topic.bumplimit?).to eq true
    end
  end

  describe "#delete_last_topic" do
    it "gets called before saving the record" do
      topic = build(:topic)
      allow(topic).to receive(:delete_last_topic)

      topic.save

      expect(topic).to have_received(:delete_last_topic)
    end
  end
end
