require 'spec_helper'

describe ProjectsController do
  include Devise::TestHelpers
  before :each do
    @user = create(:confirmed_user)
  end
  
  describe "GET #index" do
     it "loads all of the projects into @projects" do
       project1, project2 = create(:project, :lead_id => @user.id), create(:project, :lead_id => @user.id)
       get :index
       expect(assigns(:projects)).to match_array([project1, project2])
     end
   end
  
   describe "PUT #join" do
      it "allows to join an open project successfully" do
        project = create(:project, :lead_id => @user.id)
        collaborator = create(:confirmed_user)
        sign_in collaborator
        put :join, {:id => project.id}
        collaborator.reload
        expect(collaborator.is_collaborating?(project)).to eq(true)
      end
      it "should not allow to join a private project successfully" do
        project = create(:project, :lead_id => @user.id,:is_open=>false)
        collaborator = create(:confirmed_user)
        sign_in collaborator
        put :join, {:id => project.id}
        collaborator.reload
        expect(collaborator.is_collaborating?(project)).to eq(false)
      end
    end
    
    describe "POST #contribute" do
        it "posts data to a contributing project successfully" do
          project = create(:project, :lead_id => @user.id,:is_open=>false)
          project_data = {:co2_content=>"4.0",:created_at=>"2013-09-04T10:45:09Z",:photosynthetic_efficiency=>"24.0",:raw=>"24,421,124",:relative_chlorophyll_content=>"324.0",:relative_humidity=>"4.0",:subject=>"Apple",:temperature=>"44.0"}
          collaborator = create(:confirmed_user)
          collaborator.reset_authentication_token! 
          ProjectCollaborator.create(:project_id=>project.id,:user_id=>collaborator.id)
          collaborator.reload
          put :contribute, {:id => project.id,:project_datum=>project_data,:auth_token=>collaborator.authentication_token,:format=>:json}
          JSON.parse(response.body)["status"].should == "success"
          expect(project.project_data.size).to eq(1)
        end
      end
      
  # {"co2_content":4.0,"created_at":"2013-09-04T10:45:09Z","id":1,"latitude":null,"longitude":null,"photosynthetic_efficiency":24.0,"project_id":2,"raw":"24,421,124","relative_chlorophyll_content":324.0,"relative_humidity":4.0,"subject":null,"temperature":44.0,"updated_at":"2013-09-04T10:45:09Z","user_id":1}
end