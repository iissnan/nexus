class RemoveSnFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :sn
  end
end
