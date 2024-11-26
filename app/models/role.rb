class Role < ApplicationRecord
  has_many :users, foreign_key: 'roleID'

  validates :roleName, presence: true
end
