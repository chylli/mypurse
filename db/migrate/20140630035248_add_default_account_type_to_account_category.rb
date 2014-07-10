class AddDefaultAccountTypeToAccountCategory < ActiveRecord::Migration
  def change
    add_column :Categories, :default_account_type, :string
  end
end
