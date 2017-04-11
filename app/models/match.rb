class Match < ApplicationRecord
  has_many :fights
  has_many :teams, through: :fights
  has_many :attendances
  has_many :serial_numbers, through: :attendances
  has_many :goals

  validates :team1_id, presence: true
  validates :team2_id, presence: true
end
