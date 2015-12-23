class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.text :note
      t.string :image_url
      t.float :average_fare, null: false
      t.timestamps null: false
    end
  end
end
