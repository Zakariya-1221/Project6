class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :presentation_id

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :user_id
    add_foreign_key :attendances, :presentations, column: :presentation_id
  end
end
