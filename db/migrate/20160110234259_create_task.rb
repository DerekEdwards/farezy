class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :fare
      t.belongs_to :day_pass
      t.timestamps null: false
    end
  end
end
