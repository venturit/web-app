require 'spec_helper'

describe Api::V1::DataController do
  
  before :each do
    @user = create(:confirmed_user)
    
  end
  describe "POST #create" do
      it "posts data to a project successfully" do
        project = create(:project, :lead_id => @user.id,:is_open=>false)
        project_data = {:co2_content=>"4.0",:created_at=>"2013-09-04T10:45:09Z",:photosynthetic_efficiency=>"24.0",:raw=>"24,421,124",:relative_chlorophyll_content=>"324.0",:relative_humidity=>"4.0",:subject=>"Apple",:temperature=>"44.0"}
        collaborator = create(:confirmed_user)
        collaborator.reset_authentication_token! 
        ProjectCollaborator.create(:project_id=>project.id,:user_id=>collaborator.id)
        collaborator.reload
        put :create, {:project_id => project.id,:datum=>project_data,:auth_token=>collaborator.authentication_token,:format=>:json}
        JSON.parse(response.body)["status"].should == "success"
        JSON.parse(response.body)["id"].should == project.data.last.id
        expect(project.data.size).to eq(1)
      end
    end
end
