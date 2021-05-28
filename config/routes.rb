Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "events#index"
  
  resources :events
 
  resources :event_attendees, only: [:create, :destroy]
  # get 'users/:id', to: 'user#show', as: :user
  resources :users, only: [:index, :show]

end
