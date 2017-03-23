class CreateTeamsMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_matches, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :match, index: true
    end
  end
end
