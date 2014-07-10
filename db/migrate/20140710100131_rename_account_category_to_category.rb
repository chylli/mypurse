class RenameAccountCategoryToCategory < ActiveRecord::Migration
  def change
    rename_table :account_categories, :categories
  end
end
