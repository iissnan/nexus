class AddSnToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :sn, :string, default: ''
  end
end
