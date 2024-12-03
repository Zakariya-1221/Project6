class RemoveUserIdFromPresentation < ActiveRecord::Migration[7.2]
  def change
    remove_column :presentations, :user_id, if_exists: true
  end
end
