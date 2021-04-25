class ContactNumber < ApplicationRecord
  contact_number_attributes :number
  belongs_to :contactable, polymorphic: true

  enum contact_type: { phone: 0, mobile: 1, fax: 2 }
end
