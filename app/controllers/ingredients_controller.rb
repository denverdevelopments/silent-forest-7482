class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
    @dishes = @ingredient.dishes
  end
end


def index
  @merchant = Merchant.find(params[:merchant_id])
  @enabled_items = Item.all.enabled
  @top_items = Item.top_five_items(@merchant.id)
  @top_days = @top_items.map {|item| item.item_best_day.first}
end

def show
  @item = Item.find(params[:id])
  @merchant = @item.merchant
end

def edit
  @item = Item.find(params[:id])
  @merchant = @item.merchant
end

def update
  item = Item.find(params[:id])
  @merchant = item.merchant
  if params[:name]
    item.update({
      name: params[:name],
      description: params[:description],
      unit_price: params[:unit_price],
      able: params[:able]
      })
  else
    item.update({able: params[:able]})
  end
  if item.save
    flash[:notice] = "Item was successfully updated."
    redirect_to "/merchants/#{@merchant.id}/items"
    # redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"  #NOW  /items/#{item.id}
  else
    flash[:alert] = "ERROR: Item not updated."
    redirect_to "/items/#{item.id}/edit"
  end
end
