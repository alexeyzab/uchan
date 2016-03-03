class Catalog < ActiveRecord::Base
  belongs_to :board
  has_many :topics, through: :board
end
