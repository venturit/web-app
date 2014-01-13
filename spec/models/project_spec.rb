require 'spec_helper'

describe Project do
  
  before :each do
    @user = create(:confirmed_user)
    @project = create(:project, :lead_id => @user.id)
  end
  
  it "should have latitude and longitude" do
    expect(@project.latitude).to eq(42.7344398)
    expect(@project.longitude).to eq(-84.4807617)
  end
  
  it "sets the beta flag on after create" do
    @project.beta.should be_true
  end
end