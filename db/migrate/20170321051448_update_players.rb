class UpdatePlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :password_digest, :string, null: false, default: ''
    change_column_null :players, :email, false
    change_column_null :players, :name, false
    change_column_default :players, :rating, 1000
  end
end
