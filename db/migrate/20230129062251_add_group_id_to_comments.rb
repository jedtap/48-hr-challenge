class AddGroupIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :group_id, :integer
    add_index :comments, :group_id
  end
end
