Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
      
  end

  resources :authors, only: [:create, :update, :destroy]
  get 'register', to: 'authors#new'
  
  root 'posts#index' 
end
