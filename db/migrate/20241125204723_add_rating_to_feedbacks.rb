class AddRatingToFeedbacks < ActiveRecord::Migration[7.2]
  def change
    add_column :feedbacks, :rating, :integer
  end
end
