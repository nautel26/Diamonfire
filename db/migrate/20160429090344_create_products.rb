class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :sku
      t.text :description
      t.integer :product_category_id, index: true

      t.timestamps null: false
    end
  end
end
