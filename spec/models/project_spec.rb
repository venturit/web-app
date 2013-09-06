require 'spec_helper'

describe Project do
  
  before :each do
    @user = create(:confirmed_user)
    @project = create(:project, :lead_id => @user.id)
  end
  
  it "should have latitude and longitude" do
    expect(@project.latitude).to eq(42.735247)
    expect(@project.longitude).to eq(-84.4837745)
  end
  
end