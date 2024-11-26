class User < ApplicationRecord
  belongs_to :role
  has_many :attendances, foreign_key: "user_id"
  # has_many :presentations, through: :attendances
  has_many :feedbacks, foreign_key: "user_id"
  has_many :presentations, class_name: "Presentation", foreign_key: "presenter_id"


  validates :email, presence: true, length: { maximum: 50 },
    uniqueness: true, format: { with: /\A\w+\.\d+@osu\.edu\Z/i }
  validates :name, presence: true, length: { maximum: 50 }
end
