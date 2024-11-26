class User < ApplicationRecord
  belongs_to :role
  has_many :presentations, foreign_key: 'presenterID'
  has_many :feedbacks, foreign_key: 'userID'

  validates :email, presence: true, length: {maximum: 50}, uniqueness: true, format:{with: /\A\w+\.\d+@osu\.edu\Z/i }
  validates :name, presence: true, length: {maximum: 50}
end
