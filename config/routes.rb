# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :medias, only: :index do
    collection do
      get :movies
      get :seasons
    end
  end

  get "library/:user_id", controller: :library, action: :index
  post "purchase", controller: :purchase, action: :create
end
