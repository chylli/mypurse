class AddUserIdToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :user_id, :integer, null:false
    add_index :currencies, :user_id
  end
end
