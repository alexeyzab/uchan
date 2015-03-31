FactoryGirl.define do

  sequence(:name) { |n| "Board #{n}" }
  sequence(:id) { |id| id }
  sequence(:thread_name) { |t| "Thread #{t}" }
  sequence(:post_description) { |p| "Post descripiton #{p}" }

  factory :board do
    name
    category "Interests"
    id
  end

  factory :topic do
    board
    thread_name
    description "Topic description"
  end

  factory :post do
  end
end
