Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :skip => [:sessions, :registrations, :passwords]
  devise_scope :user do
  	post '/login' => 'sessions#create', :as => :user_session
    delete '/logout' => 'sessions#destroy', :as => :destroy_user_session
  end
  resources :videos, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
