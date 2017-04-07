class SerialNumber < ApplicationRecord
  before_save { self.number = self.number.to_s.downcase }
  belongs_to :player

  validates :number, uniqueness: true
end
