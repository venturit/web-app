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
  
  it "sets the beta flag after create" do
    @project.beta.should be_true
  end
  
  it "creates the slug from name" do
    @project = create(:project, :name => "Test Project", :lead_id => @user.id)
    @project.slug.should_not be_blank
    @project.slug.name.should eq("test-project")
  end
end