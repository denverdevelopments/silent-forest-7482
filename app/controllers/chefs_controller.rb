class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes

    # @sorted_ingredients = @chef.ingredients
    # @sorted_ingredients = @dishes.ingredients
    @sorted_ingredients = @chef.unique_ordered

    # @sorted_passengers = @airline.unique_adults ##new
  end

  # def destroy
  #     <%= button_to "Remove Dish", "/chefs/#{@chef.id}", method: :delete %><br>
  # end
end

# <section id="chef_ingredients">
#   <% sorted_ingredients.each do |ingredient| %>
#     <p><%= ingredient.name %></p>
#     <p><%= ingredient.calories %></p>
#   <% end %>&emsp;
# </section>

# <% dish.ingredients.each do |ing| %>
#   <p><%= ing.name %>, <%= ing.calories %> cal</p>
# <% end %><br/>
