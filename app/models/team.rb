class Team < ApplicationRecord
  has_many :team_matches
  has_many :matches, through: :team_matches

  validates :sn1, presence: true
end
