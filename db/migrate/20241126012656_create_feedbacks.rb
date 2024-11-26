class CreateFeedbacks < ActiveRecord::Migration[7.2]
  def change
    create_table :feedbacks do |t|
      t.integer :userID, null: false
      t.integer :presentationID, null: false
      t.integer :feedbackScore
      t.string :feedback
      t.datetime :submitTime

      t.timestamps
    end
    add_foreign_key :feedbacks, :users, column: :userID
    add_foreign_key :feedbacks, :presentations, column: :presentationID
  end
end
