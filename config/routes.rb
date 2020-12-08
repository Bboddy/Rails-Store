Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  resources :categories do
    resources :products
  end

  get '/cart', to: 'cart#index'
    resources :cart, path: '/cart/items'
end
