class CreatePresentations < ActiveRecord::Migration[7.2]
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
