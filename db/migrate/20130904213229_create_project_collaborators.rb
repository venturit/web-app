class CreateProjectCollaborators < ActiveRecord::Migration
  def change
    create_table :project_collaborators do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
