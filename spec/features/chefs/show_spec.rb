require 'rails_helper'

RSpec.describe 'chef show page' do
  before(:each)do
  @pat_1 = Chef.create!(name: "Pat Smith")
  @jill_2 = Chef.create!(name: "Jill Jones")

  @coucous1 = @pat_1.dishes.create!(name: "Coucous", description: "Healthy grain")
  @lamb2 = @pat_1.dishes.create!(name: "Farm Lamb", description: "Savory protein")
  @pilaf3 = @jill_2.dishes.create!(name: "Pilaf", description: "Wild rices")
  @crispy4 = @jill_2.dishes.create!(name: "Crispy Chicken", description: "Fine foul")

  @salt_1 = Ingredient.create!(name: "Salt", calories: 3)
  @butter_2 = Ingredient.create!(name: "Butter", calories: 102)
  @oil_3 = Ingredient.create!(name: "Olive Oil", calories: 250)
  @grain_4 = Ingredient.create!(name: "Grain", calories: 37)

  @coucous1.ingredients << @butter_2
  @coucous1.ingredients << @salt_1
  @coucous1.ingredients << @grain_4

  @lamb2.ingredients << @oil_3
  @lamb2.ingredients << @butter_2

  DishIngredient.create!(dish: @pilaf3, ingredient: @grain_4)
  DishIngredient.create!(dish: @pilaf3, ingredient: @oil_3)

  DishIngredient.create!(dish: @crispy4, ingredient: @oil_3)
  DishIngredient.create!(dish: @crispy4, ingredient: @butter_2)  end

  it 'lists name of chef' do
      visit "/chefs/#{{@pat_1.id}}"
    expect(page).to have_content("#{@pat_1.name}")
  end

  it 'lists chefs dishes names and descriptions' do
      visit "/chefs/#{{@pat_1.id}}"

    within("#chef_dishes") do
      within("#dish-#{@coucous1.id}") do
        expect(page).to have_content("#{@coucous1.name}")
        expect(page).to have_content("#{@coucous1.description}")
      end

      within("#dish-#{@lamb2.id}") do
        expect(page).to have_content("#{@lamb2.name}")
        expect(page).to have_content("#{@lamb2.description}")
      end
    end
  end

  it 'lists chefs dishes ingredients names and calories' do
      visit "/chefs/#{{@pat_1.id}}"
    expect(page).to have_content("#{@salt_1.name}")
    expect(page).to have_content("#{@salt_1.calories}")
    expect(page).to have_content("#{@butter_2.name}")
    expect(page).to have_content("#{@butter_2.calories}")
    expect(page).to have_content("#{@grain_4.name}")
    expect(page).to have_content("#{@grain_4.calories}")
    expect(page).to have_content("#{@oil_3.name}")
    expect(page).to have_content("#{@oil_3.calories}")
  end

  # @salt_1 = Ingredient.create!(name: "Salt", calories: 3)
  # @butter_2 = Ingredient.create!(name: "Butter", calories: 102)
  # @oil_3 = Ingredient.create!(name: "Olive Oil", calories: 250)
  # @grain_4 = Ingredient.create!(name: "Grain", calories: 37)
  #
  # @coucous1.ingredients << @butter_2
  # @coucous1.ingredients << @salt_1
  # @coucous1.ingredients << @grain_4
  #
  # @lamb2.ingredients << @oil_3
  # @lamb2.ingredients << @butter_2

  it 'has button to remove passenger next to name' do

  end
end
