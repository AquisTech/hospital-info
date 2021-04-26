class ChangeDefaultForPincode < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :pincode, true
  end
end
