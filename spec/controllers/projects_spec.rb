require 'spec_helper'

describe ProjectsController do

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
end