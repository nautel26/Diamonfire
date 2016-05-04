class Admin::CategoriesController < Admin::BaseController
  before_action :get_current_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
    @status = @category.update_attributes category_params
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  def get_current_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
