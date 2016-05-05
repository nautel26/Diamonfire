class AddFielsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :featured_image, :integer
    add_column :products, :weight, :string
  end
end
