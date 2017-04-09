class SerialNumber < ApplicationRecord
  before_save { self.number = self.number.to_s.downcase }
  belongs_to :user
  has_many :contracts
  has_many :teams, through: :contracts

  validates :number, presence: true, uniqueness: true
end
