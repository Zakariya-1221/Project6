Rails.application.routes.draw do
  root 'presentations#index'
  
  # Session routes - for login/logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :presentations do
    resources :feedbacks
  end
end
