class AddDebitAmountToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :debit_amount, :decimal, precision: 15, scale: 2, default: 0.0, null: false
  end
end
