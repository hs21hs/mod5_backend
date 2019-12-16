class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.integer :food_bank_id
      t.string :food_name
      t.string :postcode 
      t.string :type
      t.timestamps
    end
  end
end
