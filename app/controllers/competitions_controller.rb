class CompetitionsController < ApplicationController

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      flash[:success] = "Successfully created a new competition called #{@competition.name} at #{@competition.venue} in #{@competition.location}."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def competition_params
    params.require(:competition).permit(:name).permit(:year).permit(:location).permit(:venue)
  end

end
