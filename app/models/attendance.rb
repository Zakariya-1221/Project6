class Attendance < ApplicationRecord
  has_many :users, foreign_key: "user_id"
  has_many :presentations, foreign_key: "presentation_id"
end
