Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders
  resource :shop, only: %w[show]
  resources :products, only: %w[index show create update destroy]
  resource :users, only: %w[index create update destroy]
end
