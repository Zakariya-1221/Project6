class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :roleID

      t.timestamps
    end
    add_foreign_key :users, :roles, column: :roleID
  end
end
