require 'spec_helper'

describe Api::V1::SessionsController do
  
  before :each do
    @user = create(:confirmed_user)
  end

  describe "POST #sign_in" do
     it "should authenticate a confirmed user" do
       setup_controller_for_warden
       request.env["devise.mapping"] = Devise.mappings[:user]
       post "create", {:user => {:email=>@user.email,:password=>@user.password},:format=>:json}
       @user.reload
       JSON.parse(response.body)["auth_token"].should == @user.authentication_token
     end
     
     it "it should not authenticate invalid user credentials" do
       setup_controller_for_warden
       request.env["devise.mapping"] = Devise.mappings[:user]
       user = build(:user)
       post "create", {:user => {:email=>user.email,:password=>user.password},:format=>:json}
       response.status.should == 401
       JSON.parse(response.body)["message"].should == "Your email and password do not match."
     end
     
   end

  describe "DELETE #sign_out" do
     it "should sign out a logged in user" do
       setup_controller_for_warden
       request.env["devise.mapping"] = Devise.mappings[:user]
       @user.reset_authentication_token!
       authentication_token = @user.authentication_token
       delete "destroy", {:auth_token=>@user.authentication_token,:format=>:json}
       @user.reload
       @user.authentication_token.should_not == authentication_token
     end
  end
end
