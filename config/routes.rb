Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get 'contacts/new'
      get 'contacts/create'
      resources :users, only: [:index,:create,:show] do
        resources :reservations, only: [:index, :create]
      end
      resources :courses, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
 