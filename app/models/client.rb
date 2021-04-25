class Client < ApplicationRecord
  has_many :identities, as: :resource
  accepts_nested_attributes_for :identities
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses
  has_many :contact_numbers, as: :contactable
  accepts_nested_attributes_for :contact_numbers
  has_many :email_addresses, as: :emailable
  accepts_nested_attributes_for :email_addresses
  has_many :projects, as: :owner

  validates :name, presence: true
end
