Rails.application.routes.draw do
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  resources :foods, only: [:index, :show, :new, :create, :destory]
  resources :recipes, only: [:index, :show, :new, :create, :destory]
  resources :recipe_foods, only: [:create, :destroy]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]

end
