class Admin::BaseController < ApplicationController
  before_action :is_admin?

end
