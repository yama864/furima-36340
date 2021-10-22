Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items', to: 'items#index'
  get 'orders', to: 'orders#index'
  root to: "items#index"

  resources :items do
    resources :orders, only: [:index, :create]
  end
end
