require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should belong_to :match }
  it { should belong_to :team }
  it { should validate_presence_of(:match_id) }
  it { should validate_presence_of(:team_id) }
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:at) }
end
