class TeamsController < ApplicationController
  before_action :authenticate_player!, only: [:edit, :update, :destroy]
  def index
  	@teams = Team.all
  end

  def new
  	@team = Team.new
  end

  def create
  	@team = Team.new(team_params)
    if @team.save
      flash[:info] = "Player has been successfully created."
      redirect_to @team
    else
      render 'new'
    end
  end

  def show
  	@team = Team.find(params[:id])
  end

  def edit
  	@team = Team.find(params[:id])
  end

  def update
  	@team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Team updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  private
    def team_params
      params.require(:team).permit(playbooks_attributes: [:id])
    end
end
