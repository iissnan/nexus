class ChangeEmailPresenceForPlayers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :players, :email, true
  end
end
