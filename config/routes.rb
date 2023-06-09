Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index,:create] do
        resources :reservations, only: [:index, :create]
      end
      resources :courses, only: [:index, :show, :create, :destroy]
    end
  end
end
 