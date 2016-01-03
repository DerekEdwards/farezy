class AddCardNameToCity < ActiveRecord::Migration
  def change
    add_column :cities, :card_name, :string, null: false, default: "transit card"
  end
end
