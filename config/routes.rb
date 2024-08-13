Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :flats do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[show] do
    resources :flat_reviews, only: %i[new create]
  end

  resources :users, only: :show do
    resources :user_reviews, only: %i[new create]
  end

  resources :flat_reviews, only: %i[edit update]
  resources :user_reviews, only: %i[edit update]
end
