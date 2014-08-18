class AddExchangeRateToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :exchange_rate, :decimal, precision: 15, scale: 4, null: false, default: 1.0000
  end
end
