class Fare < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.belongs_to :city
      t.float :cost, null: false
      t.timestamps null: false
    end
  end
end
