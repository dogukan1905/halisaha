class CreatePlaybook < ActiveRecord::Migration[5.0]
  def change
     create_table :playbooks do |t|
      t.belongs_to :player, index: true
      t.belongs_to :team, index: true
      t.timestamps
    end
  end
end
