class ChangeProductCategory < ActiveRecord::Migration
  def change
    rename_column :products, :product_category_id, :category_id
  end
end
