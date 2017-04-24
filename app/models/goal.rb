class Goal < ApplicationRecord
  belongs_to :team
  belongs_to :match

  validates :match_id, presence: true
  validates :team_id, presence: true
  validates :score, presence: true
  validates :at, presence: true
end
