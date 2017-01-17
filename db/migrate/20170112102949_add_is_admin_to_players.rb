class AddIsAdminToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :is_admin, :boolean
  end
end
