class CreateMatchVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :match_votes do |t|

      t.timestamps
    end
  end
end
