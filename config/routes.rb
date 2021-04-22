Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'chefs#index'

resources :chefs, only: [:index, :show] do
  resources :dishes, only: [:index, :show]
end
resources :ingredients, only: [:index, :show]

end
