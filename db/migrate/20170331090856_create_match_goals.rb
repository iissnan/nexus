class CreateMatchGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :match_goals do |t|
      t.references :match
      t.integer :score
      t.string :player1_sn
      t.string :player2_sn, null: true
      t.datetime :at
      t.timestamps
    end
  end
end
