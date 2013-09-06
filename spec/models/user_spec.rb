require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.create(:confirmed_user)
  end

  it 'should be a confirmed user' do
    @user.confirmed_at.should_not be_nil
  end
  
end
