Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'ingredients#show'

resources :chefs, only: [:show]
resources :ingredients, only: [:show] do
  resources :dishes, only: [:destroy]
end

end
