class AddBestGoalToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches,:best_goal_id,:integer
    add_foreign_key :matches, :goals, column: :best_goal_id
  end
end
