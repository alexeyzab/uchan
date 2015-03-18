require "rails_helper"

describe Board do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).
       is_at_most(40) }
end
