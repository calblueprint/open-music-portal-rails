class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])

    @user = nil
    if signed_in?
      @user = current_user
    end
  end

end
