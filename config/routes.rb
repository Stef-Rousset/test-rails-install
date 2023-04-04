Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "shops#index"
  resources :shops, only: [:index, :show] do
    resources :schedules
  end
end
