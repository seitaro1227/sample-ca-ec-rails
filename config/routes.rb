Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :shop, only: %w[show]
  resources :products, only: %w[index show create update destroy]
  # resource :order, only: %w[create update destroy]
  # resource :users, only: %w[index show create update destroy]
  # resource :shop, only: %w[show]
end
