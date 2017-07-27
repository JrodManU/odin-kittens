Rails.application.routes.draw do

  root 'kittens#index'

  resources :kittens

  namespace :api, defaults: { format: :json } do
    resources :kittens
  end
end
