class AddDirectionsToCollaboratorsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :directions_to_collaborators, :text
  end
end
