class User < ApplicationRecord
    belongs_to :role
    has_many :feedbacks
    has_many :presentations, through: :feedbacks

    def teacher?
        role.name == 'teacher'
    end

    def student?
        role.name == 'student'
    end
  
    validates :email, presence: true, length: { maximum: 50 },
                      uniqueness: true, format: { with: /\A\w+\.\d+@osu\.edu\Z/i }
    validates :name, presence: true, length: { maximum: 50 }
  end