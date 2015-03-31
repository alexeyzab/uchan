class RenameTopicNameToThreadName < ActiveRecord::Migration
  def change
    rename_column :topics, :topic_name, :thread_name
  end
end
