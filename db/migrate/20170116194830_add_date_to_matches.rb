class AddDateToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :played_at, :datetime
  end
end
