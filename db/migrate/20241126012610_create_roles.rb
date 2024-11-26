class CreateRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :roles, id: false do |t|
      t.primary_key :role_id
      t.string :roleName

      t.timestamps
    end
  end
end
