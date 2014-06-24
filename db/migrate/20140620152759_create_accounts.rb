class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :description
      t.string :category_id
      t.integer :user_id
      t.integer :type_id
      t.integer :currency_id
      t.decimal :balance, precision: 15, scale: 2, null: false, default: 0.00
      t.boolean :hidden
      t.timestamps
    end
    add_index :accounts, :name, unique: true
    add_index :accounts, :user_id
  end
end
