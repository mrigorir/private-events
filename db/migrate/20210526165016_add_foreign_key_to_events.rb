class AddForeignKeyToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
    
  end
  add_index :events, :creator_id
end
