class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def average_years
    @project = Project.find(params[:id])
    @years = 0
    @project.contestants.each do |contestant|
      @years += contestant.years_of_experience
    end
    @ave_years = @years/@project.contestants.count
    binding.pry
  end

    private
    def project_params
      params.permit(:name, :material)
    end

end
