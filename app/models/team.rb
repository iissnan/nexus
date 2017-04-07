class Team < ApplicationRecord
  has_many :team_matches
  has_many :teamworks
  has_many :matches, through: :team_matches
  has_many :players, through: :teamworks

  validates :player1_id, presence: true
end
