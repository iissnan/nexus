require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_many :team_matches }
  it { should have_many :teams }
  it { should have_many :match_goals }
  it { should validate_presence_of(:home_team_id) }
  it { should validate_presence_of(:away_team_id) }
end
