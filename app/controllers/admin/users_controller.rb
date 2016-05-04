class Admin::UsersController < Admin::BaseController
  before_action :get_current_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update user_params
    if @user.save
      flash[:notice] = "Update user successfully"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :phone_number, :address, :province
  end

  def get_current_user
    @user = User.find_by id: params[:id]
  end
end
