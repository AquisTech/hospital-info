class AddBedsToHospitals < ActiveRecord::Migration[6.1]
  def change
    add_column :hospitals, :vacant_gen_beds, :integer, default: 0
    add_column :hospitals, :occupied_gen_beds, :integer, default: 0
    add_column :hospitals, :vacant_o2_beds, :integer, default: 0
    add_column :hospitals, :occupied_o2_beds, :integer, default: 0
    add_column :hospitals, :vacant_icu_beds, :integer, default: 0
    add_column :hospitals, :occupied_icu_beds, :integer, default: 0
    add_column :hospitals, :vacant_ventilators, :integer, default: 0
    add_column :hospitals, :occupied_ventilators, :integer, default: 0
  end
end
