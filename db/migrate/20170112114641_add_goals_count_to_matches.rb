class AddGoalsCountToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :goals_count, :integer
  end
end
