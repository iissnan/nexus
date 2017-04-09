require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :serial_number }
  it { should validate_presence_of(:name) }
  it { should allow_values(%w[foo@bar.com, foo.bar@baz.com]).for(:email) }
  it { should_not allow_values(%w[foo, foo#baz.com]).for(:email) }

  it 'should downcase email before save' do
    @user = FactoryGirl.create(:user, email: 'Foo@Bar.com')
    expect(@user.email).to eq('foo@bar.com')
  end

  it 'should downcase name before save' do
    @user = FactoryGirl.create(:user, name: 'FOO')
    expect(@user.name).to eq('foo')
  end

  it 'should set default value for display_name' do
    @user = FactoryGirl.create(:user, name: 'foo')
    expect(@user.display_name).to eq('foo')
  end
end
