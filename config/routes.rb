Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :update, :destroy] do 
      member do
        get :unpub
      end
    end
      
  end
  
  root 'posts#index' 
end
