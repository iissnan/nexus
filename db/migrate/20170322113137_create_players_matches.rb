class CreatePlayersMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :players_matches, id: false do |t|
      t.belongs_to :players, index: true
      t.belongs_to :matches, index: true
    end
  end
end
