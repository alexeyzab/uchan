require "rails_helper"

describe Post do
  it { should validate_attachment_content_type(:post_image).
       allowing("image/png", "image/gif", "image/jpg").
       rejecting("text/plain", "text/xml") }

  it "has proper attributes" do
    post = build(:post)

    expect(post).to be_valid
  end

  it "can't be created with wrong attributes" do
    post = build(:post, post_description: nil)

    expect(post).to be_invalid
    expect(post.errors[:post_description]).to eq(["can't be blank"])
  end

  it "has the proper post_description length" do
    post = build(:post, post_description: "#{'a' * 501}")

    expect(post).to be_invalid
  end
end
