class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :debit_id, null: false
      t.integer :credit_id, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false, default: 0.00

      t.timestamps
    end
  end
end
