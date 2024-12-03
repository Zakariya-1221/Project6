class Role < ApplicationRecord
  has_many :users, foreign_key: "role_id"
  validates :name, presence: true, uniqueness: true
end