require 'rails_helper'

RSpec.describe Fight, type: :model do
  it { should belong_to :team }
  it { should belong_to :match }
end
