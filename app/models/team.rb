class Team < ApplicationRecord
  has_and_belongs_to_many :players,
                          join_table: 'players_teams'
  has_and_belongs_to_many :matches,
                          join_table: 'teams_matches'

  validates_presence_of :player1_id
end
