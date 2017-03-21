require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it {
    valid_emails = %w[foo@bar.com, foo.bar@baz.com]
    should allow_values(valid_emails).for(:email)
  }
  it {
    invalid_emails = %w[foo, foo#baz.com]
    should_not allow_values(invalid_emails).for(:email)
  }
  it 'should downcase email before save' do
    @player = FactoryGirl.build(:player)
    @player.email = 'Foo@Bar.com'
    @player.save
    expect(@player.email).to eq('foo@bar.com')
  end

  it 'should downcase name before save' do
    @player = FactoryGirl.build(:player)
    @player.name = 'FOO'
    @player.save
    expect(@player.name).to eq('foo')
  end
end
