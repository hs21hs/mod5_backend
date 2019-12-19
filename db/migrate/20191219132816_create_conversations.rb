class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.references :giver, null: false, foreign_key: true
      t.references :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
