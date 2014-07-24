class AddInitBalanceToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :init_balance, :decimal, default: 0.0
  end
end
