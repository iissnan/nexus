class Match < ApplicationRecord
  has_and_belongs_to_many :players
  has_and_belongs_to_many :teams

  validates_presence_of :home_team_id
  validates_presence_of :away_team_id
end
