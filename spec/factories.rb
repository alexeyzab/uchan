include ActionDispatch::TestProcess

FactoryGirl.define do

  sequence(:name) { |n| "Board #{n}" }
  sequence(:id) { |id| id }
  sequence(:topic_name) { |t| "Topic #{t}" }
  sequence(:post_description) { |p| "Post descripiton #{p}" }

  factory :board do
    name
    category "Interests"
    id
  end

  factory :topic do
    board
    topic_name
    description "Topic description"
    topic_image { fixture_file_upload("#{Rails.root}/spec/support/test.jpg", "image/jpg") }
  end

  factory :post do
    board
    topic
    post_title "Hi there"
    post_description
  end
end
