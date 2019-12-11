class CreateRiders < ActiveRecord::Migration[6.0]
  def change
    create_table :riders do |t|
      t.integer :user_id
      t.string :address
      t.string :postcode
      t.timestamps
    end
  end
end
