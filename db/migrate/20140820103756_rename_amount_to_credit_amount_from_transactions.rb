class RenameAmountToCreditAmountFromTransactions < ActiveRecord::Migration
  def change
    rename_column :transactions, :amount, :credit_amount
  end
end
