Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')

  resources :users
  resources :presentations do
    resources :feedbacks
  end
end
