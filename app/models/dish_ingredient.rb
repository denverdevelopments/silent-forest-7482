class DishIngredient <ApplicationRecord
  # validates :dish_id, presence: true
  # validates :ingredient_id, presence: true
  
  belongs_to :dish
  belongs_to :ingredient
end
