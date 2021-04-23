class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @three_best = @chef.top_three
    # binding.pry 
  end
end
