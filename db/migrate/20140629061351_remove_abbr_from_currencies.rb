class RemoveAbbrFromCurrencies < ActiveRecord::Migration
  def change
    remove_column :currencies, :abbr, :string
  end
end
