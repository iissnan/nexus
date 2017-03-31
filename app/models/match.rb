class Match < ApplicationRecord
  has_and_belongs_to_many :players,
                          join_table: 'players_matches'
  has_and_belongs_to_many :teams,
                          join_table: 'teams_matches'
  has_many :match_goals

  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
end
