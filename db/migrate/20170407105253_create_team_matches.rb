class CreateTeamMatches < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams_matches
    drop_table :players_matches
    create_table :team_matches do |t|
      t.belongs_to :match
      t.belongs_to :team
      t.timestamps
    end
  end
end
