class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.string :score
      t.float :point
      t.string :known_as

      t.timestamps
    end
  end
end
