class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.integer :identity_type, null: false
      t.string :value, null: false
      t.references :resource, polymorphic: true, index: true

      t.timestamps
    end
  end
end
