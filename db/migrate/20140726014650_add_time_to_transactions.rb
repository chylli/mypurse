class AddTimeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :time, :datetime
  end
end
