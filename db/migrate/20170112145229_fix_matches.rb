class FixMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps null: false
    end
    add_index :matches, :team1_id
    add_index :matches, :team2_id
    add_index :matches, [:team1_id, :team2_id]
  end
end
