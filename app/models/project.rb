class Project < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :allocations
  has_many :work_times, through: :allocations

  monetize :quote_amount_cents
  monetize :order_amount_cents

  def quote_amount_cents=(val)
    super(Money.from_amount(val.to_i, self.quote_amount_currency).cents)
  end

  def order_amount_cents=(val)
    super(Money.from_amount(val.to_i, self.order_amount_currency).cents)
  end

  enum status: {
    order_confirmed: 0,
    in_progress: 1,
    development_completed: 2,
    deployed: 3,
    support_ended: 4
  }
end
