Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "shops#index"
  resources :shops, only: [:index, :show] do
    resources :schedules, only: [:show, :create, :update]
  end
  resources :schedules, only: [:index, :destroy]
end
