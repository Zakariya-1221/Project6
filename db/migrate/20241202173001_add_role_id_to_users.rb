class AddRoleIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role_id, :integer
    add_foreign_key :users, :roles
    add_index :users, :role_id
  end
end