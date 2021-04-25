class Identity < ApplicationRecord
  belongs_to :resource, polymorphic: true

  enum identity_type: { registration_number: 0 }
end
