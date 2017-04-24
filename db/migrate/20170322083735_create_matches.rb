class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :team1_id, index: true, null: false
      t.integer :team2_id, index: true, null: false
      t.integer :team1_score
      t.integer :team2_score
      t.timestamps
    end
  end
end
