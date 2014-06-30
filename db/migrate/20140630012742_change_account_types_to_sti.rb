class ChangeAccountTypesToSti < ActiveRecord::Migration
  def up
    add_column :accounts, :type,  :string, limit: 64
    add_index :accounts, :type
    remove_column :accounts, :type_id
    drop_table :account_types
  end

  def down
    revert do
      add_column :accounts, :type,  :string, limit: 64
      add_index :accounts, :type
      remove_column :accounts, :type_id
    end

    create_table "account_types", force: true do |t|
      t.integer  "user_id",                null: false
      t.string   "name",        limit: 32, null: false
      t.string   "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
