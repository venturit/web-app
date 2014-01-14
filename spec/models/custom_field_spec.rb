require 'spec_helper'

describe CustomField do
  before(:each) do
    user = create(:confirmed_user)
    project = create(:project, lead_id: user.id)
    @custom_field = build(:custom_field, project_id: project.id)
  end
  
  it 'is valid' do
    @custom_field.should be_valid
  end
end
