class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.string :website

      t.timestamps
    end
  end
end
