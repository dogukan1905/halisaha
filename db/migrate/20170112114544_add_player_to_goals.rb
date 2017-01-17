class AddPlayerToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :player, foreign_key: true
  end
end
