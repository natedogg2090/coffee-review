class AddColumnToRoast < ActiveRecord::Migration[5.2]
  def change
    add_column :roasts, :roaster_id, :integer
  end
end
