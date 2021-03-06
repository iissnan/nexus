class SerialNumber < ApplicationRecord
  before_save { self.number = self.number.to_s.downcase }
  belongs_to :user, optional: true
  has_many :contracts
  has_many :teams, through: :contracts
  has_many :attendances
  has_many :matches, through: :attendances

  validates :number, presence: true, uniqueness: true
end
