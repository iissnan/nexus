require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should belong_to :match }
  it { should validate_presence_of(:match_id) }
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:player1_sn) }
  it { should validate_presence_of(:at) }
end
