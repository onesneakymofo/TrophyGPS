require 'faker'
User.destroy_all

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  puts "Creating user #{name}"

  User.create(
    name: name,
    email: "#{name}@email.com"
  )
end
