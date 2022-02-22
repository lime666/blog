class RemoveAncestryFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_index :comments, :ancestry
    remove_column :comments, :ancestry, :string
  end
end
