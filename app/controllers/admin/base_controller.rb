class Admin::BaseController < ApplicationController
  before_action :admin_user

  private

    def admin_user
      redirect_to(root_url) unless current_user && current_user.has_admin_dashboard_access?
    end

    def is_admin?
      redirect_to(root_url) unless current_user && current_user.is_admin?
    end

end
