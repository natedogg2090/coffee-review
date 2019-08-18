class RemoveColumnFromRoasts < ActiveRecord::Migration[5.2]
  def change
    remove_column :roasts, :user_id
  end
end
