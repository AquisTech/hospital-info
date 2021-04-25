class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :contact_numbers, as: :contactable
  accepts_nested_attributes_for :contact_numbers
  has_many :email_addresses, as: :emailable
  accepts_nested_attributes_for :email_addresses

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
