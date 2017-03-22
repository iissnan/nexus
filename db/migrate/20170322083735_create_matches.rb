class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id, index: true, null: false
      t.integer :away_team_id, index: true, null: false
      t.integer :home_team_score, null: false
      t.integer :away_team_score, null: false
      t.timestamps
    end
  end
end
