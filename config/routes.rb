Rails.application.routes.draw do
  resources :users

  resources :presentations do
    # Submit/view feedback for a presentation
    resources :feedbacks, only: [ :create, :show ] 
    # Non-presenters can submit feedback
    get "feedback_submission", on: :member, to: "feedbacks#new"
    # Presenters can view all feedback
    get "view_feedbacks", on: :member, to: "presentations#view_feedbacks"
  end
end
