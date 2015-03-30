FactoryGirl.define do  factory :post do
    
  end

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
end
