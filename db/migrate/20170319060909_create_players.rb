class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.text :display_name
      t.text :avatar
      t.integer :rating

      t.timestamps
    end
  end
end
