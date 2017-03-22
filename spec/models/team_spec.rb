require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should validate_presence_of(:player1_id) }
end
