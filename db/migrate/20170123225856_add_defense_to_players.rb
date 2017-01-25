class AddDefenseToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :defense, :float
  end
end
