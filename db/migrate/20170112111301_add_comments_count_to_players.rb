class AddCommentsCountToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :comments_count, :integer
  end
end
