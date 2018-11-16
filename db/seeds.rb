# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Creating drinks...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized_ = open(url).read
ingredients = JSON.parse(ingredients_serialized_)

x = 0

ingredients["drinks"].each do |ingredient|
  ing = Ingredient.create(name: ingredient["strIngredient1"])
  x += 1
end
puts "Created #{x} seeds!"
