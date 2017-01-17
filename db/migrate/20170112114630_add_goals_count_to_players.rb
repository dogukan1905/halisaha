class AddGoalsCountToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :goals_count, :integer
  end
end
