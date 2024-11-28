class User < ApplicationRecord
    belongs_to :role
    has_many :feedbacks
    has_many :presentations, through: :feedbacks

end
