class CreateAuthorCommentVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :author_comment_votes do |t|
      t.integer :author_id
      t.integer :comment_id
      t.integer :vote_value, default: 0

      t.timestamps
    end

    add_index :author_comment_votes, [:author_id, :comment_id], unique: true
  end
end
