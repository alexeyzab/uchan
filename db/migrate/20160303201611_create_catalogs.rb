class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.integer :board_id
    end

    add_foreign_key :catalogs, :boards
  end
end
