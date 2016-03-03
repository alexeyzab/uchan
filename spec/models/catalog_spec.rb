require "rails_helper"

describe Catalog, :type => :model do
  it { should belong_to(:board) }
  it { should have_many(:topics).through(:board) }
end
