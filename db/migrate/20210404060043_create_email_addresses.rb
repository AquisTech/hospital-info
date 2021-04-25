class CreateEmailAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :email_addresses do |t|
      t.integer :email_type, null: false
      t.string :email, null: false
      t.references :emailable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
