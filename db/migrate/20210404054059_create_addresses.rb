class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :address_type
      t.boolean :primary, default: false
      t.string :address_line_1, null: false
      t.string :address_line_2
      t.string :area
      t.string :city, null: false
      t.string :district
      t.string :state
      t.string :country, null: false
      t.string :pincode, null: false
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
