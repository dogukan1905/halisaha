class RemovePlayerIdFromTeams < ActiveRecord::Migration[5.0]
  def change
  	remove_column :teams, :player_id
  end
end
