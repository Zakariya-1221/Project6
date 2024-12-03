class AddAuthenticationToUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :password, :string
    add_column :users, :password_digest, :string
    add_column :users, :role_id, :integer
    add_foreign_key :users, :roles, column: :role_id, primary_key: :role_id
  end
end