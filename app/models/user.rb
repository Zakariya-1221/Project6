# app/models/user.rb
class User < ApplicationRecord
    belongs_to :role
    has_many :feedbacks
    has_many :presentations, foreign_key: 'presenter_id'
    
    has_secure_password
    
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true, on: :create
    
    def admin?
      role.name == 'admin'
    end
    
    def student?
      role.name == 'student'
    end
  end