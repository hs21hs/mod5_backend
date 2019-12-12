class CreateGivers < ActiveRecord::Migration[6.0]
  def change
    create_table :givers do |t|
      t.integer :user_id
      t.string :postcode
      t.string :city
      t.string :country
      t.string :latitude
      t.string :longitude
      
   

      t.timestamps
    end
  end
end
