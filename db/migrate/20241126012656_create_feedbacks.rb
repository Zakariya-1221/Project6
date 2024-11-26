class CreateFeedbacks < ActiveRecord::Migration[7.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id, null: false
      t.integer :presentation_id, null: false
      t.integer :feedbackScore
      t.string :feedback
      t.datetime :submitTime

      t.timestamps
    end
    add_foreign_key :feedbacks, :users, column: :user_id
    add_foreign_key :feedbacks, :presentations, column: :presentation_id
  end
end
