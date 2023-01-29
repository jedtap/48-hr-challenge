class AddUserIdToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :user_id, :integer
    add_index :replies, :user_id
  end
end
