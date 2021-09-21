Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :arts, only: [:create]
      resources :categories, only: [:create]
      resources :users
      resources :rated_arts, only: [:index]
    end
  end
end
