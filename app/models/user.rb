class User < ApplicationRecord
    belongs_to :role
    has_many :feedbacks
    has_many :presentations, through: :feedbacks

    validates :role, presence: true
    validates :name, presence: true, length: { maximum: 10}
    validates :email, presence: true, length: { maximum: 50 }, uniqueness: true, 
              format: { with: /\A\w+\.\d+@osu\.edu\Z/i }
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password

    def role?(role)
        self.role.name == "teacher"
    end
end
