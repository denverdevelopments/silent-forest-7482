class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    dishs = @chef.dishes
  end
end