class Role < ApplicationRecord
  has_many :users, foreign_key: "role_id"
  validates :roleName, presence: true, uniqueness: true
end