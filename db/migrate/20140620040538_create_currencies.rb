class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, limit: 20
      t.string :abbr, limit: 10
      t.string :symbol, limit: 6
      t.timestamps
    end
  end
end
