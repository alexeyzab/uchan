class RenameThreadName < ActiveRecord::Migration
  def change
    rename_column :topics, :thread_name, :topic_name
  end
end
