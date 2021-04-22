# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all
DishIngredient.destroy_all

pat = Chef.create!(name: "Pat Smith")
jill = Chef.create!(name: "Jill Jones")

coucous = pat.dishes.create!(name: "Coucous", description: "Healthy grain")
lamb = pat.dishes.create!(name: "Farm Lamb", description: "Savory protein")
pilaf = Dish.create!(name: "Pilaf", description: "Wild rices", chef_id: jill.id)
crispy = Dish.create!(name: "Crispy Chicken", description: "Fine fowl", chef_id: jill.id)

salt = Ingredient.create!(name: "Salt", calories: 3)
butter = Ingredient.create!(name: "Butter", calories: 102)
oil = Ingredient.create!(name: "Olive Oil", calories: 250)
grain = Ingredient.create!(name: "Grain", calories: 37)

coucous.ingredients << butter
coucous.ingredients << salt
coucous.ingredients << grain

lamb.ingredients << oil
lamb.ingredients << butter

DishIngredient.create!(dish: pilaf, ingredient: grain)
DishIngredient.create!(dish: pilaf, ingredient: oil)

DishIngredient.create!(dish: crispy, ingredient: oil)
DishIngredient.create!(dish: crispy, ingredient: butter)
