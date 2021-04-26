class Hospital < ApplicationRecord
  has_many :identities, as: :resource
  accepts_nested_attributes_for :identities
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses
  has_many :contact_numbers, as: :contactable
  accepts_nested_attributes_for :contact_numbers
  has_many :email_addresses, as: :emailable
  accepts_nested_attributes_for :email_addresses

  validates :name, presence: true

  def self.filter(params)
    records = Hospital.all
    records = records.where("UPPER(name) LIKE '%#{params[:name].upcase}%'") if params[:name].present?
    if params[:pincode].present?
      records = records.joins(:addresses).where("addresses.pincode LIKE '%#{params[:pincode]}%'")
    end
    availability_query = []
    [:gen_beds, :o2_beds, :icu_beds, :ventilators].each do |attr|
      availability_query << "vacant_#{attr} > 0" if params[attr] == '1'
    end
    unless availability_query.empty?
      availability_query = "(#{availability_query.join(' OR ')})"
      records = records.where(availability_query)
    end
    records
  end
end
