class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
    end
  end
end
