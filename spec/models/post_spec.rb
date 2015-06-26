require 'rails_helper'

describe Post, :type => :model do
  it { should belong_to(:topic) }
  it { should belong_to(:board) }
  it { should validate_presence_of(:post_description) }
  it { should validate_length_of(:post_description).is_at_most(500) }
  it { should validate_attachment_content_type(:post_image).
       allowing('image/png', 'image/gif', 'image/jpg').
       rejecting('text/plain', 'text/xml') }
end
