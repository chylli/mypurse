class AddTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :type, :string, limit: 64
    add_index :categories, :type
  end
end
