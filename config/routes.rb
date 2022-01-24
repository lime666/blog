Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
     
  end

  get 'search', to: 'posts#search' 

  resources :authors, only: [:create, :update, :destroy]
  get 'register', to: 'authors#new'

  resources :sessions, only: [:create, :destroy]
  get 'sign_in', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy'
  
  root 'posts#index' 
end
