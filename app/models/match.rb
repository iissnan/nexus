class Match < ApplicationRecord
  has_many :team_matches
  has_many :teams, through: :team_matches
  has_many :match_goals

  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
end
