Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :properties
      resources :property_images
      resources :bookings

      root to: "users#index"
    end
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}

  resources :properties, :only => [:show, :index] do
      resources :bookings, :except => [:show, :index]
  end

  post '/contact', to: 'home#contact', as: 'contact'

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
