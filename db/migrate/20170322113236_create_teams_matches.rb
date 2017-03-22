class CreateTeamsMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_matches, id: false do |t|
      t.belongs_to :teams, index: true
      t.belongs_to :matches, index: true
    end
  end
end
