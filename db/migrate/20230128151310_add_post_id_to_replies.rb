class AddPostIdToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :post_id, :integer
    add_index :replies, :post_id
  end
end
