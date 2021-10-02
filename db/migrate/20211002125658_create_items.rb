class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :title
      t.integer :price
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :postage_id
      t.integer :prefecture_id
      t.integer :period_id
      t.references :user, null: false, foreign_key: true
      
    end
  end
end
