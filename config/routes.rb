Rails.application.routes.draw do



  ActiveAdmin.routes(self)
  resources :dialogs do
      put :add, to: "dialogs#add"
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users
  resources :artworks

  get "/collection", to: "dialogs#collection"

end


