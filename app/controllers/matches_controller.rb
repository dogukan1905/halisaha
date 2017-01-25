class MatchesController < ApplicationController
  before_action :authenticate_player!, only: [:edit, :update, :destroy]
  def index
  	@matches = Match.all
  end

  def new
  	@match = Match.new
  end

  def create
  	@match = Match.new(match_params)
    if @match.save
      flash[:info] = "Match has been successfully created."
      redirect_to @match
    else
      render 'new'
    end
  end

  def show
  	@match = Match.find(params[:id])
  end

  def edit
  	@match = Match.find(params[:id])
  end

  def update
  	@match = Match.find(params[:id])
    if @match.update_attributes(match_params)
      flash[:success] = "Match updated"
      redirect_to @match
    else
      render 'edit'
    end
  end

  private
    def match_params
      params.require(:match).permit(:point, :played_at, goals_attributes: [:id], teams_attributes: [:id])
    end
end
