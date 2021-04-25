class WorkTime < ApplicationRecord
  belongs_to :allocation
  has_one :user, through: :allocation
  has_one :project, through: :allocation

  enum status: { entered: 0, updated: 1, approved: 2, billed_to_client: 3, held_payment: 4, paid_to_user: 5 }

  before_validation :set_computed_hours

  def set_computed_hours
    self.computed_hours = (hours * 60 + minutes) / 60.0
  end

end
