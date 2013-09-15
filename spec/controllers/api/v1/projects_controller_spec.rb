require 'spec_helper'

describe Api::V1::ProjectsController do

  before :each do
    @user = create(:confirmed_user)
  end
  describe "GET #index" do
      it "should list all projects" do
        project1, project2 = create(:project, :lead_id => @user.id), create(:project, :lead_id => @user.id)
        @user.reset_authentication_token!
        get :index,{:auth_token=>@user.authentication_token}
        response.status == 200
        JSON.parse(response.body).size.should == 2
      end
    end
end
