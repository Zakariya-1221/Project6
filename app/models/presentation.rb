class Presentation < ApplicationRecord
  has_many :users, foreign_key: 'presenterID'
  has_many :feedbacks, foreign_key: 'presentationID'

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
