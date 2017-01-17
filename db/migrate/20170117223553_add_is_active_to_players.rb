class AddIsActiveToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :is_active, :boolean
  end
end
