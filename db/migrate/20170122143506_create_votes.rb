class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :match_point
      t.json :player_points
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
