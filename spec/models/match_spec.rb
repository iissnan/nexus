require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_many :fights }
  it { should have_many :teams }
  it { should have_many :attendances }
  it { should have_many :serial_numbers }
  it { should have_many :goals }
  it { should validate_presence_of(:team1_id) }
  it { should validate_presence_of(:team2_id) }
end
