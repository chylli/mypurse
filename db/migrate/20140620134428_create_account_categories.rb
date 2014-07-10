class CreateAccountCategories < ActiveRecord::Migration
  def change
    create_table :Categories do |t|
      t.references :user, null: false
      t.string :name, limit: 32, null: false
      t.string :description, limit: 255
      t.integer :parent_id
      t.timestamps
    end
    add_index :Categories, :name, unique:true
    add_index :Categories, :user_id
  end
end
