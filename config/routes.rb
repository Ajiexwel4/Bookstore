Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :books
  root 'home#index'

  get '/book_page', to: 'home#book_page'
  get '/cart', to: 'home#cart'
  get '/catalog', to: 'home#catalog'
  get '/checkout_address', to: 'home#checkout_address'
  get '/checkout_complete', to: 'home#checkout_complete'
  get '/checkout_confirm', to: 'home#checkout_confirm'
  get '/checkout_delivery ', to: 'home#checkout_delivery'
  get '/checkout_payment ', to: 'home#checkout_payment'
  get '/home', to: 'home#home'
  # get '/log_in', to: 'home#log_in'
  # get '/new_password', to: 'home#new_password'
  get '/orders', to: 'home#orders'
  # get '/password', to: 'home#password'
  get '/settings', to: 'home#settings'
  get '/ui_kit', to: 'home#ui_kit'
  get '/view_orders', to: 'home#view_orders'
end
