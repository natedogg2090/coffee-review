class CreateRoasts < ActiveRecord::Migration[5.2]
  def change
    create_table :roasts do |t|
      t.string :name
      t.string :origin
      t.text :tasting_notes
      t.string :preparation_method
      t.integer :price
      t.integer :inventory
      t.datetime :roasted_date
      t.belongs_to :roaster
    end
  end
end
