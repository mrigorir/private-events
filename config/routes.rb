Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "events#index"
  
  resources :events
 
  resources :event_attendees, only: [:create, :destroy]
  get 'user/:id', to: 'user#show', as: :user
  resources :users
end
