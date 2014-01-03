class Admin::BaseController < ApplicationController
  before_action :is_admin?

  private

    def admin_user
      redirect_to(root_url) unless current_user and current_user.has_role? :admin
    end

end
