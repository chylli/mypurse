class AddTypeToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :type, :string, limit: 32, null: false
  end
end
