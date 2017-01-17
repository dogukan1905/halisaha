class PlayersController < ApplicationController
  before_action :authenticate_player!, only: [:edit, :update, :destroy]
  def index
  	@players = Player.all
  end

  def new
  	@player = Player.new
  end

  def create
  	@player = Player.new(player_params)
    if @player.save
      flash[:info] = "Player has been successfully created."
      redirect_to @player
    else
      render 'new'
    end
  end

  def show
  	@player = Player.find(params[:id])
  end

  def edit
  	@player = Player.find(params[:id])
  end

  def update
  	@player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = "Profile updated"
      redirect_to @player
    else
      render 'edit'
    end
  end

  private
    def player_params
      params.require(:player).permit(:username, :firstname, :lastname, :password, :password_confirmation, :is_active)
    end
end
