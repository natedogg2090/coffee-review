class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.belongs_to :user
      t.belongs_to :roast
    end
  end
end
