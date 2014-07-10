class DropTransactionCategories < ActiveRecord::Migration
  def up
    drop_table :transaction_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
