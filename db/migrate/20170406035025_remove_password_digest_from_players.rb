class RemovePasswordDigestFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :password_digest
  end
end
