class Team < ApplicationRecord
  has_many :fights
  has_many :matches, through: :fights
  has_many :contracts
  has_many :serial_numbers, through: :contracts

  validates :sn1, presence: true
end
