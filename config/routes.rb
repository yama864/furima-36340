Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items', to: 'items#index'
  root to: "items#index"

  resources :items , only: [:index, :create, :new]
end
