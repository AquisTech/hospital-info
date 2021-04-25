# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin user
admin = User.where(email: 'admin@example.com').first_or_initialize
admin.password = 'admin@123'
admin.password_confirmation = 'admin@123'
if admin.save
  admin.confirm
  puts 'Admin created!'
else
  puts "Admin creation failed! #{admin.errors.full_messages.to_sentence}"
end