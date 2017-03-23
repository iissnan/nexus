class Match < ApplicationRecord
  has_and_belongs_to_many :players,
                          join_table: 'players_matches'
  has_and_belongs_to_many :teams,
                          join_table: 'teams_matches'

  validates_presence_of :home_team_id
  validates_presence_of :away_team_id
end
