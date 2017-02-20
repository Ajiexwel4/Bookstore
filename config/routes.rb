Rails.application.routes.draw do
  get 'catalog/index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)

  root 'home#index'

  get 'store/index'

  resources :books
  resources :orders
end
