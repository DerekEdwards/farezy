class DayPass < ActiveRecord::Migration
  def change
    create_table :day_passes do |t|
      t.belongs_to :city
      t.float :cost, null: false
      t.timestamps null: false
    end
  end
end
