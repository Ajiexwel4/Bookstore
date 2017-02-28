Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)

  get 'catalog/index', as: 'catalog'
  root 'home#index'

  resources :books do
    resources :reviews
  end

  resources :orders
  resources :carts
  resources :line_items
  resources :reviews
end
