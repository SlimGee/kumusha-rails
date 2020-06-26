Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
    get '/', to: 'properties#index'
    resources :properties, :except => [:show]
  end

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}

  resources :properties, :only => [:show, :index] do
      resources :bookings, :except => [:show, :index]
  end

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
