# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
  User.create(
    name: Faker::Name.name, 
    password: SecureRandom.hex,
    admin: [true, false].sample
  )
end

10.times do 
  Recipe.create(
    name: Faker::Lorem.sentence, 
    instructions: Faker::Lorem.paragraph(2),
    user_id: rand(1..10),
    time_in_minutes: rand(1..90)
  )
end

10.times do 
  Ingredient.create(
    name: ["butter", "eggs", "milk", "ground beef", "flour", "sugar", "oil", "baking powder", "olive oil", "carrots", "chocolate chips", "strawberries"].sample
  )
end

20.times do 
  RecipeIngredient.create(
    quantity: "#{rand(1..4)} #{["cups", "tablespoons", "teaspoons", "grams"].sample}",
    ingredient_id: rand(1..10),
    recipe_id: rand(1..10)
  )
end

20.times do 
  Favorite.create(
    recipe_id: rand(1..10),
    user_id: rand(1..10)
  )
end

20.times do 
  Comment.new(
    recipe_id: rand(1..10),
    user_id: rand(1..10),
    rating: 6,
    description: Faker::Lorem.sentence
  )
end
