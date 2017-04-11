class Attendance < ApplicationRecord
  belongs_to :serial_number
  belongs_to :match
end
