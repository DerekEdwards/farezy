class AddFontColorHexToCity < ActiveRecord::Migration
  def change
    add_column :cities, :font_color_hex, :string, null: false, default: "#FFFFFF"
  end
end
