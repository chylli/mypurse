class AddDefaultAccountTypeToAccountCategory < ActiveRecord::Migration
  def change
    add_column :account_categories, :default_account_type, :string
  end
end
