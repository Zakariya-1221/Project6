# class Presentation < ApplicationRecord
#     has_many :feedbacks, dependent: :destroy
#     accepts_nested_attributes_for :feedbacks

#     validates :title, presence: true
#     validates :description, presence: true
# end
 class Presentation < ApplicationRecord
    belongs_to :presenter, class_name: 'User', optional: true
    has_many :feedbacks, dependent: :destroy
    
    validates :title, presence: true
    validates :description, presence: true
  end
