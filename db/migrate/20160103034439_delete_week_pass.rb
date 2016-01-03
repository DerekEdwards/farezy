class DeleteWeekPass < ActiveRecord::Migration
  def change
    drop_table :week_passes
    add_column :day_passes, :days, :integer, null: false, default: 1
  end
end
