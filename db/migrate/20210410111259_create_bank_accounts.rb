class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number
      t.string :account_holder_name
      t.integer :code_type
      t.string :code
      t.string :branch_name
      t.references :resource, polymorphic: true, null: false

      t.timestamps
    end
  end
end
