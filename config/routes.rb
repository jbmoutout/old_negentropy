Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'tweet/new'

  get 'tweet/create'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  resources :users
  resources :artworks
end
