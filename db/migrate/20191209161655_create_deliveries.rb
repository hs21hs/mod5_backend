class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :status
      t.string :food_name
      t.string :d_type
      t.string :time_type
      t.integer :rider_id
      t.integer :giver_id
      t.integer :food_bank_id
      t.string :pick_up_postcode
      t.timestamps
    end
  end
end
