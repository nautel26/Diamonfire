class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product_categories = ProductCategory.all
  end
end
