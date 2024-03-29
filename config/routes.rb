Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy] do
      post 'like', to: 'author_comment_votes#like'
      post 'dislike', to: 'author_comment_votes#dislike'
    end
     
  end

  get 'search', to: 'posts#search' 

  resources :authors, only: [:create, :edit, :update, :destroy]
  get 'register', to: 'authors#new'
  get 'profile', to: 'authors#profile'

  resources :sessions, only: [:create, :destroy]
  get 'sign_in', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy'
  
  root 'posts#index' 
end
