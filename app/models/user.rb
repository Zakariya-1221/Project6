class User < ApplicationRecord
    has_many :feedbacks
    has_many :presentations, through: :feedbacks
end
