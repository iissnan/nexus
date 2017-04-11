require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it { should belong_to :serial_number }
  it { should belong_to :match }
end
