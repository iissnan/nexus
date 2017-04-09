class Contract < ApplicationRecord
  belongs_to :serial_number
  belongs_to :team
end
