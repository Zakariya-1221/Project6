class Presentation < ApplicationRecord
  belongs_to :presenter, class_name: "User", foreign_key: "presenter_id"
  has_many :attendances
  has_many :users, through: :attendances

  # has_many :users, foreign_key: 'presenterID'
  has_many :feedbacks, foreign_key: "presentation_id"

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
