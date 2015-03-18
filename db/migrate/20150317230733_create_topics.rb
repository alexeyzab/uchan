class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic_name
      t.text :description
      t.integer :board_id
    end

    add_foreign_key :topics, :boards
  end
end
