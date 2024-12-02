class Role < ApplicationRecord
<<<<<<< HEAD
    has_many :users
  
    validates :name, presence: true, uniqueness: true
  end
=======
  has_many :users, foreign_key: "role_id"

  validates :roleName, presence: true
end
>>>>>>> branch2
