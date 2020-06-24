Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
  end
  resources :properties
  devise_for :users
  root to: "home#index"


  namespace :admin do
      get '/', to: 'properties#index'
      resources :properties, :except => [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
