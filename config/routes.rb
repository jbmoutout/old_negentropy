Rails.application.routes.draw do

  get 'tweet/new'

  get 'tweet/create'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  resources :users
  resources :artworks
end
