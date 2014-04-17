class AddForumIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forum_id, :integer
    add_index :users, :forum_id
  end
end
