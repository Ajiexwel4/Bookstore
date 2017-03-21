Rails.application.routes.draw do
  get 'users/edit'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)

  get 'catalog/index', as: 'catalog'
  root 'home#index'

  resources :books do
    resources :reviews
  end

  resources :orders, only: [:index, :show]
  resources :carts, only: [:show]
  resources :line_items
  resources :reviews  
  resources :checkouts

  resource :user, only: [:edit, :destroy] do
    collection do
      patch 'update_password'
      patch 'update_billing_address'
      patch 'update_shipping_address'
      patch 'update_email'
    end
  end
end