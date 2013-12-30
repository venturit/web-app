require 'spec_helper'

describe Api::V1::DataController do
  
  before :each do
    @user = create(:confirmed_user)
    
  end
  describe "POST #create" do
      it "posts data to a project successfully" do
        project = create(:project, :lead_id => @user.id,:is_open=>false)
        project_data = {:device_version=>"1",:co2_content=>"4.0",:created_at=>"2013-09-04T10:45:09Z",:photosynthetic_efficiency_phi2=>"24.0",:data_raw=>"24,421,124",:fs=>"23.2",:fm=>"55.4",:relative_humidity=>"4.0",:tags=>"Apple",:temperature=>"44.0",:baseline=>"20.31",:co2_raw=>"12,32,51",:co2_slope=>"-.82",:co2_start=>"850",:co2_end=>"450",:co2_drop=>".50",:light_intensity=>"120",:blue=>"102",:green=>"32",:red=>"12",:led_low=>"42",:led_high=>"76",:ir_low=>"76",:ir_high=>"109"}
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
