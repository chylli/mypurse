class CreateTransactionCategories < ActiveRecord::Migration
  def change
    create_table :transaction_categories do |t|
      t.references :user, null: false
      t.string :name, limit: 32, null: false
      t.string :description, limit:255
      t.integer :parent_id
      t.timestamps
    end
  end
end
