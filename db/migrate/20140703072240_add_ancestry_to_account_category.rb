class AddAncestryToAccountCategory < ActiveRecord::Migration
  def change
    remove_column :account_categories, :parent_id, :integer
    add_column :account_categories, :ancestry, :string
    add_index :account_categories, :ancestry
  end
end
