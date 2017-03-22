class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, default: ''
      t.integer :player1_id, index: true, null: false
      t.integer :player2_id, index: true
      t.string :player1_position
      t.string :player2_position
      t.timestamps
    end
  end
end
