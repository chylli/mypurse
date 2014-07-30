class CreateAccountCategories < ActiveRecord::Migration
  def change
    create_table :account_categories do |t|
      t.references :user, null: false
      t.string :name, limit: 32, null: false
      t.string :description, limit: 255
      t.integer :parent_id
      t.timestamps
    end
    add_index :account_categories, :name, unique:true
    add_index :account_categories, :user_id
  end
end
