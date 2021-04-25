class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :identities, as: :resource
  accepts_nested_attributes_for :identities
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses
  has_many :contact_numbers, as: :contactable
  accepts_nested_attributes_for :contact_numbers
  has_many :email_addresses, as: :emailable
  accepts_nested_attributes_for :email_addresses
  has_one :bank_account, as: :resource
  accepts_nested_attributes_for :bank_account
  has_many :allocations
  has_many :work_times, through: :allocations

  # TODO: Add scope for active allocations

  def full_name
    "#{first_name} #{last_name}"
  end
end
