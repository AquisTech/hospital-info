class CreateContactNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_numbers do |t|
      t.integer :contact_type, null: false
      t.string :number, null: false
      t.string :note
      t.references :contactable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
