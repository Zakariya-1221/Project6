class Feedback < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :presentation, foreign_key: "presentation_id"

  validates :feedbackScore, presence: true, numericality:
    { only_integer: true, greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10 }
  validates :feedback, presence: true
end
