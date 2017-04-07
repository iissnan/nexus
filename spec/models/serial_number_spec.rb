require 'rails_helper'

RSpec.describe SerialNumber, type: :model do
  it { should validate_uniqueness_of :number }
end
