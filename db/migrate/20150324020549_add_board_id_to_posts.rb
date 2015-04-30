class AddBoardIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :board_id, :integer
  end

  def down
    remove_column :posts, :board_id, :integer
  end
end
