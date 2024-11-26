Rails.application.routes.draw do
  resources :users
  resources :presentations do
    resources :feedbacks
  end
end
