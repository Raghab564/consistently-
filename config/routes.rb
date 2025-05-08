Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  get "home/index"
  devise_for :users
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "home#index"  # Create a simple home page if desired
  end

  resources :habits do
    resources :habit_checkins, only: [ :create, :destroy ]
  end
end
