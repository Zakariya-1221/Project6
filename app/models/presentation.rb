class Presentation < ApplicationRecord
    belongs_to :user
    has_many :feedbacks, dependent: :destroy
    accepts_nested_attributes_for :feedbacks
end
