class CreateVoting < ActiveRecord::Migration[5.0]
  def change
     create_table :votings do |t|
      t.belongs_to :player, index: true
      t.belongs_to :vote, index: true
      t.timestamps
    end
  end
end