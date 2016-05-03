module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!, :authenticate_manager!
    layout "dashboard"

    private
    def authenticate_manager!
      if current_user.member?
        flash[:danger] = "application.flash.permission_denied"
        redirect_to root_path
      end
    end
  end
end
