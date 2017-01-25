class AddPassionToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :passion, :float
  end
end
