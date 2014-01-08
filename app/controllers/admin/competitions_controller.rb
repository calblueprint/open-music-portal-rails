class Admin::CompetitionsController < Admin::BaseController

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      flash[:success] = "Successfully created a new competition called #{@competition.name} at #{@competition.venue} in #{@competition.location}."
      redirect_to admin_dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @competition = Competition.find(params[:id])
  end

  def index
    @competitions = Competition.active.paginate(page: params[:page], per_page: 10)
  end

  def show
    @competition = Competition.find(params[:id])
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :year, :location, :venue)
  end

end
