Rails.application.routes.draw do
  root to: 'home#index'
  resources :properties, only: [:new, :create, :show]
end
