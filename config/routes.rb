Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  ActiveAdmin.routes(self)

  get 'catalog/index'
  root 'home#index'


  resources :books
  resources :orders
end
