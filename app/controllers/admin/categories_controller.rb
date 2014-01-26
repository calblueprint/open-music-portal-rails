class Admin::CategoriesController < Admin::BaseController
  before_action :admin_user, only: [:edit, :update, :show_comments]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.competition = Competition.find(params[:competition_id])
    if @category.save
      redirect_to admin_category_path(@category)
    else
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def search
    @categories = Category.search(params[:q]).paginate(page: params[:page], per_page: 10)
    render :index
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to admin_category_path(@category)
    else
      render 'new'
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :age_limit)
    end

end
