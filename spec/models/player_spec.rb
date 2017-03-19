require 'rails_helper'

RSpec.describe Player, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
