class MatchGoal < ApplicationRecord
  belongs_to :match

  validates :match_id, presence: true
  validates :score, presence: true
  validates :player1_sn, presence: true
  validates :at, presence: true
end
