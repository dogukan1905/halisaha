class CreatePlayerVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :player_votes do |t|

      t.timestamps
    end
  end
end
