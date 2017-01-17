class AddTeamToMatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :team, foreign_key: true
  end
end
