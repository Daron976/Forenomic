Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users

  resources :categories, only: [:index, :show, :destroy, :create, :new] do
    resources :dealings, only: [:index, :show, :destroy, :create, :new]
  end

end
