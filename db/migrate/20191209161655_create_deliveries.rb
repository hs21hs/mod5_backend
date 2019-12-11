class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :status
      t.integer :rider_id
      t.integer :giver_id
      t.integer :food_bank_id
      t.timestamps
    end
  end
end
