class AddPublishedToCity < ActiveRecord::Migration
  def change
    add_column :cities, :published, :boolean, default: false
  end
end
