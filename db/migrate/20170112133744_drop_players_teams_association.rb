class DropPlayersTeamsAssociation < ActiveRecord::Migration[5.0]
  def change
  	drop_table :players_teams
  end
end
