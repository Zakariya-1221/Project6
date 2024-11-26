class Feedback < ApplicationRecord
  belongs_to :presentation
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true
end