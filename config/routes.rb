Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'tweet/new'

  get 'tweet/create'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users
  resources :artworks
end


