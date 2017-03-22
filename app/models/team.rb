class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_and_belongs_to_many :matches

  validates_presence_of :player1_id
end
