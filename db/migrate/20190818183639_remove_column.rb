class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :roasts, :roaster_id
  end
end
