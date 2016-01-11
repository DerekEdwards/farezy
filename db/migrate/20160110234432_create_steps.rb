class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :task
      t.string :title
      t.text :body
      t.integer :index, null: false
      t.timestamps null: false
    end
  end
end
