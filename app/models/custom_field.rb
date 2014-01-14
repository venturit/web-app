class CustomField < ActiveRecord::Base
  belongs_to :project
  attr_accessible :label, :options, :project_id, :value
end
