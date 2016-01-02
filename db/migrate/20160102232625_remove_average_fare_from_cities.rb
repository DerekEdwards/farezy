class RemoveAverageFareFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :average_fare, :float
  end
end
