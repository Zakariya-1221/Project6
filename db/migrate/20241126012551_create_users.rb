class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role_id

      t.timestamps
    end
    add_foreign_key :users, :roles, column: :role_id
  end
end
