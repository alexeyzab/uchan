require "rails_helper"

describe Topic, :type => :model do
  it { should belong_to(:board) }
  it { should validate_presence_of(:thread_name) }
  it { should validate_length_of(:thread_name).
       is_at_most(100) }
  it { should validate_length_of(:description).
       is_at_most(500) }
end
