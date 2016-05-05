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
    featured_image = nil
    if @status
      flash[:notice] = "Update product successfully"
      Array(params[:product][:images]).each_with_index do |image, index|
        image = @product.attachments.create file: image
        if featured_image.nil? && (params[:product][:image_ids].include? params[:product][:featured_image_id])
          featured_image = image.id
        end
      end
      featured_image = params[:product][:featured_image_id] if featured_image.nil?
      @product.update_attributes featured_image: featured_image
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
