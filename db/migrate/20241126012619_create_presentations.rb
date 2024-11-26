class CreatePresentations < ActiveRecord::Migration[7.2]
  def change
    create_table :presentations do |t|
      t.string :title, null: false
      t.string :description
      t.date :date
      t.time :time
      t.integer :presenterID, null: false

      t.timestamps
    end
    add_foreign_key :presentations, :users, column: :presenterID
  end
end
