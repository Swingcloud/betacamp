# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: 'admin@betacamp.co',
  password: 'secretsecret',
  password_confirmation: 'secretsecret',
  admin: true
)

categories = %w(Books Clothes 3C Groceries Food )

categories.each do |name|
  category = Category.create!(
    name: name, description: Faker::Lorem.sentences(rand(3..5)).join
  )

  rand(12..18).times do
    name = Faker::Commerce.product_name
    friendly_id = name.downcase.to_param.gsub(' ','-')
    category.products.create!(
      name: name,
      description: Faker::Lorem.sentences(rand(3..5)).join,
      content: Faker::Lorem.paragraphs(rand(5..8)).join("\n"),
      price: Faker::Commerce.price * 30,
      active: true,
      friendly_id: friendly_id
    )
  end
end