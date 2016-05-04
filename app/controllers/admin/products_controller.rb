class Admin::ProductsController < Admin::BaseController
  before_action :get_current_product, only: [:edit, :update, :destroy]
  before_action :get_collections

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @status = @product.save
    if @status
      flash[:notice] = "Create product successfully"
      Array(params[:product][:images]).each do |image|
        @product.attachments.create file: image
      end
    end
  end

  def edit
  end

  def update
    @status = @product.update_attributes product_params
    if @status
      flash[:notice] = "Update product successfully"
      Array(params[:product][:images]).each do |image|
        @product.attachments.create file: image
      end
      Attachment.where(id: Array(params[:product][:removed_image_ids])).destroy_all
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit *Product::ATTRIBUTES
  end

  def get_current_product
    @product = Product.find_by id: params[:id]
  end

  def get_collections
    @categories = Category.pluck :name, :id
    @product ||= Product.new
    @attachments = @product.attachments
  end
end
