Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#api'
  resources :items, only: [:index]
  resources :baskets, only: [:create, :index]
end
