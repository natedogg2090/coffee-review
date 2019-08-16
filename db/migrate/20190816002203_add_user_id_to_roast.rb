class AddUserIdToRoast < ActiveRecord::Migration[5.2]
  def change
    add_column :roasts, :user_id, :integer
  end
end
