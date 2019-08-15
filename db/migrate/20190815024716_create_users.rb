class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :money
      t.boolean :admin
      t.string :prep_pref

      t.timestamps
    end
  end
end
