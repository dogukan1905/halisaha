class VotesController < ApplicationController
  before_action :authenticate_player!
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :player_voted_check, only: [:new]
  before_action :player_played_check, only: [:new]
  before_action :admin?, without: [:new]


  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
    @players = (@current_match.team1.players + @current_match.team2.players).uniq
  end

  # # GET /votes/1/edit
  # def edit
  #   @players = (@current_match.team1.players + @current_match.team2.players).uniq
  # end

  # POST /votes
  # POST /votes.json
  def create
    params["vote"].permit!
    @vote = Vote.new(params["vote"])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /votes/1
  # # PATCH/PUT /votes/1.json
  # def update
  #   ap @vote
  #   raise
  #   params["vote"].permit!
  #   respond_to do |format|
  #     if @vote.update(params["vote"])
  #       format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @vote }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @vote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /votes/1
  # # DELETE /votes/1.json
  # def destroy
  #   @vote.destroy
  #   respond_to do |format|
  #     format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:match_point, :player_points, :match_id, :player_id) 
    end

    def player_played_check
      unless (@current_match.team1.players + @current_match.team2.players).include?(current_player)
        flash[:info] = "C'mon man... You have not played in that match!"
        redirect_to :root
      end
    end

    def player_voted_check
      unless @current_match.votes.where(player_id: current_player.id).empty?
        flash[:info] = "You have already voted."
        redirect_to :root
      end
    end

    def admin?
      unless is_admin?
        flash[:info] = "You are not authorized."
        redirect_to :root
      end
    end
end
