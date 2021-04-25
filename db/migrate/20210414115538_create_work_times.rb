class CreateWorkTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :work_times do |t|
      t.references :allocation, null: false, foreign_key: true
      t.date :work_date
      t.integer :hours
      t.integer :minutes
      t.float :computed_hours
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
