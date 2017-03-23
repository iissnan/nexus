class CreatePlayersMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :players_matches, id: false do |t|
      t.belongs_to :player, index: true
      t.belongs_to :match, index: true
    end
  end
end
