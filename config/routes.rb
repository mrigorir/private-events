Rails.application.routes.draw do
  root to: "events#index"
  resources :events
  resources :event_attendees, only: [:create, :destroy] do
    member do
      post :attend
    end
  end
  devise_for :users
  
  resources :users, only: [:index, :show] 
end