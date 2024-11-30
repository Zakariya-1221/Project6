Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/index"
  
  get "admin_dashboard", to: "static_pages#admin_dashboard", as: "admin_dashboard"
  resources :users

  resources :presentations do
    # Submit/view feedback for a presentation
    resources :feedbacks, only: [ :create, :show ] 
    # Non-presenters can submit feedback
    get "feedback_submission", on: :member, to: "feedbacks#new"
    # Presenters can view all feedback
    get "view_feedbacks", on: :member, to: "presentations#view_feedbacks"
  end

  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :presentations
  resources :feedbacks
  
end
