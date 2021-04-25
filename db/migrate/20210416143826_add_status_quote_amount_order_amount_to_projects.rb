class AddStatusQuoteAmountOrderAmountToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :status, :integer, default: 0
    add_monetize :projects, :quote_amount
    add_monetize :projects, :order_amount
  end
end
