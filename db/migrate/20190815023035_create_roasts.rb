class CreateRoasts < ActiveRecord::Migration[5.2]
  def change
    create_table :roasts do |t|
      t.string :name
      t.string :origin
      t.text :tasting_notes
      t.string :prep
      t.integer :rating
      t.integer :price

      t.timestamps
    end
  end
end
