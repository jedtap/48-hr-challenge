class AddGroupIdToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :group_id, :integer
    add_index :replies, :group_id
  end
end
