class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_title, :string
    add_column :posts, :post_description, :text
    add_column :posts, :board_id, :integer
    add_column :posts, :topic_id, :integer
  end
end
