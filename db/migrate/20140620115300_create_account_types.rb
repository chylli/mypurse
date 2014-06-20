class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.references :user, null: false
      t.string :name, limit: 32, null: false
      t.string :description, limit: 255
      t.timestamps
    end
    add_index :account_types, :name, unique:true
    add_index :account_types, :user_id
  end
end
