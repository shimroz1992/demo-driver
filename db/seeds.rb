# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

(1..10).each do |n|
  puts n
  Driver.create(name: "Shimroz #{n}",
                address: 'Test addrres',
                licence_d: '3456787654',
                date_of_birth: Time.now,
                user_id: User.last.id)
end
