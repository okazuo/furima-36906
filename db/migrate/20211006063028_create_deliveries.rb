class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_number, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :lot_number, null: false
      t.string :building
      t.string :telephone, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
