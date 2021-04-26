# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Create admin user...'
admin = User.where(email: 'admin@example.com').first_or_initialize
admin.password = 'admin@123'
admin.password_confirmation = 'admin@123'
admin.first_name = 'Admin'
admin.last_name = 'User'
if admin.save
  admin.confirm
  puts 'Admin created!'
else
  puts "Admin creation failed! #{admin.errors.full_messages.to_sentence}"
end
puts 'Populating Hospitals...'

require 'csv'

CSV.foreach('db/data/hospitals.csv', headers: true, col_sep: '~') do |row|
  data = row.to_h
  h_data = {
    name: data["Hospital_Name"],
    addresses_attributes: {
      0 => {
        address_type: "main",
        primary: true,
        address_line_1: "#{data['Building']}, #{data['street']}",
        address_line_2: data['landmark'],
        area: data['area'],
        city: data['city'],
        district: '',
        state: data['state'],
        country: "India",
        pincode: data['pincode']
      }
    }
  }

  landlines = data['landline'].to_s.split(',')
  landlines.each_with_index do |landline, index|
    h_data[:contact_numbers_attributes] ||= {}
    h_data[:contact_numbers_attributes][index] = {contact_type: "phone", note: "Landline", number_isd_code: "0091", number_without_isd_code: landline}
  end
  landlines_count = landlines.size
  mobiles = data['mobile'].to_s.split(',')
  mobiles.each_with_index do |mobile, index|
    h_data[:contact_numbers_attributes] ||= {}
    h_data[:contact_numbers_attributes][landlines_count + index + 1] = {contact_type: "mobile", note: "", number_isd_code: "0091", number_without_isd_code: mobile}
  end
  h_data[:email_addresses_attributes] = {0 => {email_type: "main", email: data['email']}} if data['email'].present?
  h = Hospital.where(name: data["Hospital_Name"]).first_or_initialize
  h.assign_attributes(h_data)
  if h.save
    puts "Saved #{h.name}"
  else
    puts "Failed: #{h.errors.full_messages.to_sentence}"
  end
end
