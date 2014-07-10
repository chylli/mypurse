class AddAncestryToAccountCategory < ActiveRecord::Migration
  def change
    remove_column :account_categories, :parent_id, :integer
    add_column :Categories, :ancestry, :string
    add_index :Categories, :ancestry
  end
end
