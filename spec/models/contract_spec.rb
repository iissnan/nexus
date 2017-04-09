require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should belong_to :serial_number }
  it { should belong_to :team }
end
