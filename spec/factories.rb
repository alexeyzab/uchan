FactoryGirl.define do
  sequence(:name) { |n| "Board #{n}" }
  sequence(:id) { |id| id }
  sequence(:topic_name) { |t| "Topic #{t}" }
  sequence(:post_description) { |p| "Post descripiton #{p}" }

  factory :board do
    name
    id
  end

  factory :topic do
    board
    topic_name
    description "Topic description"
  end

  factory :post do
    board
    topic
    post_description
  end
end
