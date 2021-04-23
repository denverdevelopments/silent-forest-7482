class DishesController < ApplicationController

  def destroy
    # dish = Dish.find(params[:id])
    # binding.pry
    di = DishIngredient.where(ingredient_id: params[:ingredient_id], dish_id: params[:id]).first
    di.destroy
    redirect_to "/ingredients/#{params[:ingredient_id]}"
  end
end
