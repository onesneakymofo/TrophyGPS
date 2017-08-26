require 'faker'
User.destroy_all
Post.destroy_all

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  puts "Creating user #{name}"

  user = User.create(
    name: name,
    email: "#{name.split(' ').join('_')}@email.com",
    password: 'password'
  )

  post = Post.create(
    user: user,
    description: Faker::RickAndMorty.quote,
    coordinates: [
      Faker::Number.normal(33.513164, 0.00001),
      Faker::Number.normal(-86.807892, 0.00001)
    ]
  )
end
