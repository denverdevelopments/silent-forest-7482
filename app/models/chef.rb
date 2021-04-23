class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def top_three
    Chef.joins(dishes: :ingredients)
        .group("ingredients.id").select("ingredients.name, count(dishes.id) as dish_tally").order(dish_tally: :desc).where(id: self.id).limit(3)
  end

  # def self.listed
  #   order("name").distinct
  #   # order(name:).distinct
  # end
end

# <p><%=  button_to "Delete", "chefs/#{dish.chef.id}/dish/#{dish.id}", method: :delete %></p>


# <section id="chef_names"><br/>
# <h4>&emsp;these chefs use it --</h4>
# <% @chefs.each do |chef| %>
# <p><%=  chef.name %> </p>
# <% end %>
# </section>

# <section id="chef_names">
# <h4>&emsp;these chefs use it --</h4>
# <% @dishes.each do |dish| %>
# <p><%=  dish.chef.name %> </p>
# <% end %>
# </section>
