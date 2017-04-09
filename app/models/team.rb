class Team < ApplicationRecord
  has_many :team_matches
  has_many :matches, through: :team_matches
  has_many :contracts
  has_many :serial_numbers, through: :contracts

  validates :sn1, presence: true
end
