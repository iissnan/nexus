require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many :fights }
  it { should have_many :matches }
  it { should have_many :contracts }
  it { should have_many :serial_numbers }
  it { should have_many :goals }
  it { should validate_presence_of(:sn1) }
end
