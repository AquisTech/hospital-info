class ChangeColumnDefaultForBedsAvailability < ActiveRecord::Migration[6.1]
  def change
    change_column_default :hospitals, :vacant_gen_beds, from: 0, to: nil
    change_column_default :hospitals, :occupied_gen_beds, from: 0, to: nil
    change_column_default :hospitals, :vacant_o2_beds, from: 0, to: nil
    change_column_default :hospitals, :occupied_o2_beds, from: 0, to: nil
    change_column_default :hospitals, :vacant_icu_beds, from: 0, to: nil
    change_column_default :hospitals, :occupied_icu_beds, from: 0, to: nil
    change_column_default :hospitals, :vacant_ventilators, from: 0, to: nil
    change_column_default :hospitals, :occupied_ventilators, from: 0, to: nil
  end
end
