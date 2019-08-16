class AddColumnToRoaster < ActiveRecord::Migration[5.2]
  def change
    add_column :roasters, :roast_id, :integer
  end
end
