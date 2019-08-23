class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.belongs_to :user_id
      t.belongs_to :roaster_id
    end
  end
end
