class AddPointToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :point, :float
  end
end
