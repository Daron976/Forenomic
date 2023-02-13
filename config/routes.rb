Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :welcome, only: [:index]

  resources :categories, only: [:index, show, :destroy, :create, :new] do
    resources :categories, only: [:index, show, :destroy, :create, :new]
  end

end
