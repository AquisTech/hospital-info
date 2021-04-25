class Allocation < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :work_times

  monetize :client_rate_cents
  monetize :user_rate_cents

  def client_rate_cents=(val)
    super(Money.from_amount(val.to_i, self.client_rate_currency).cents)
  end

  def user_rate_cents=(val)
    super(Money.from_amount(val.to_i, self.user_rate_currency).cents)
  end
end
