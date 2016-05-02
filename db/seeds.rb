# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  category = Category.create name: Faker::Commerce.department,
   description: Faker::Lorem.paragraph
  10.times do |ii|
    category.products.create name: Faker::Commerce.product_name,
      price: Faker::Commerce.price, sku: Faker::Code.isbn,
      description: Faker::Lorem.paragraph
  end
end
