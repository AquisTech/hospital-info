class BankAccount < ApplicationRecord
  belongs_to :resource, polymorphic: true

  enum code_type: { IFSC: 0, SWIFT: 1, IBAN: 2, BSB: 3 }
end
