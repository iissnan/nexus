require 'rails_helper'

RSpec.describe SerialNumber, type: :model do
  it { should belong_to :user }
  it { should have_many :contracts }
  it { should have_many :teams }
  it { should have_many :attendances }
  it { should have_many :matches }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
end
