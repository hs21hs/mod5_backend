class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rider_id
      t.integer :giver_id
      t.string :owner
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
