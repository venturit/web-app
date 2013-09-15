require 'spec_helper'

describe DataController do

  before :each do
    @user = create(:confirmed_user)
  end
  describe "GET #show" do
      it "should render show view for the given datum successfully" do
        project = create(:project, :lead_id => @user.id,:is_open=>false)
        datum = {:co2_content=>"4.0",:created_at=>"2013-09-04T10:45:09Z",:photosynthetic_efficiency=>"24.0",:raw=>"24,421,124",:relative_chlorophyll_content=>"324.0",:relative_humidity=>"4.0",:subject=>"Apple",:temperature=>"44.0"}
        collaborator = create(:confirmed_user)
        datum[:user_id] = collaborator.id
        ProjectCollaborator.create(:project_id=>project.id,:user_id=>collaborator.id)
        project.data << Datum.new(datum)
        get :show, {:project_id => project.id,:id=>project.data.last.id}
       expect(assigns(:data)).to match_array([project.data.last])
      end
    end
  
end
