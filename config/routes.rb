Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :dialogs do
    put :add, to: "dialogs#add"
    put :remove, to: "dialogs#remove"
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

    namespace :account do
      resource :email, only: [:edit, :update]
    end
  end

  resources :users
  resources :artworks
  resources :artists, only: [:index, :show]

  get "/collection", to: "dialogs#collection"
end
