require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many :team_matches }
  it { should have_many :matches }
  it { should have_many :contracts }
  it { should have_many :serial_numbers }
  it { should validate_presence_of(:sn1) }
end
