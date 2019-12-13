class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.timestamps
    end
  end
end
