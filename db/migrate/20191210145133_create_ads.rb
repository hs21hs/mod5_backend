class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.string :food_name
      t.string :postcode 
      t.timestamps
    end
  end
end
