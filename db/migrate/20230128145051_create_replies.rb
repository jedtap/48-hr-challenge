class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :feedback
      t.integer :comment_id

      t.timestamps
    end

    add_index :replies, :comment_id
  end
end
