class RemoveCategoryIdFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :category_id
  end
end
