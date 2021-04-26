class ContactNumber < ApplicationRecord
  attr_accessor :number_isd_code, :number_without_isd_code

  belongs_to :contactable, polymorphic: true

  enum contact_type: { phone: 0, mobile: 1, fax: 2 }

  def number_isd_code
    @number_isd_code ||= number && number[0..3]
  end

  def number_isd_code=(val)
    @number_isd_code = val
    self.number = "#{val}#{number_without_isd_code}"
  end
  def number_without_isd_code
    @number_without_isd_code ||= number && number[4..-1]
  end
  def number_without_isd_code=(val)
    @number_without_isd_code = val
    self.number = "#{number_isd_code}#{val}"
  end
  validates :number_isd_code, presence: true, if: proc { |model| model.number_without_isd_code.present? }
  validates :number_without_isd_code, presence: true, if: proc { |model| model.number_isd_code.present? }
  # validates :number, phony_plausible: true, if: proc { |model|
  #   model.number_isd_code.present? && model.number_without_isd_code.present?
  # }
end
