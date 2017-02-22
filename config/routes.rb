Rails.application.routes.draw do
  resources :line_items
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)

  get 'catalog/index'
  root 'home#index'


  resources :books
  resources :orders
  resources :carts
end
