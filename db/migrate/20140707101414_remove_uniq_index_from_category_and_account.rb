class RemoveUniqIndexFromCategoryAndAccount < ActiveRecord::Migration
  def change
    remove_index :account_categories, :name
    remove_index :accounts, :name
  end
end
