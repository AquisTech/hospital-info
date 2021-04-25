class Identity < ApplicationRecord
  belongs_to :resource, polymorphic: true

  enum identity_type: { GST_number: 0, ABN: 1 }
end
