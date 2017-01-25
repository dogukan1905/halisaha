class AddAttackToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :attack, :float
  end
end
