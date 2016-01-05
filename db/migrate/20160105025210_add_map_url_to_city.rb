class AddMapUrlToCity < ActiveRecord::Migration
  def change
    add_column :cities, :map_url, :string
  end
end
