class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum address_type: { main: 0, communication: 1 }
end
