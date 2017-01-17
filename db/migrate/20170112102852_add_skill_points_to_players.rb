class AddSkillPointsToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :skill_points, :json
  end
end
