class AddPresenterIdToPresentations < ActiveRecord::Migration[7.2]
  def change
    add_column :presentations, :presenter_id, :integer 
    
  end
end
