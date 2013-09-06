class ProjectCollaborator < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :project_id, :user_id

  validates :project_id, :uniqueness => { :scope => :user_id }
end
