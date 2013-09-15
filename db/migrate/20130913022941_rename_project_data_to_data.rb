class RenameProjectDataToData < ActiveRecord::Migration
  def up
     rename_table :project_data, :data
  end

  def down
    rename_table :data, :project_data
  end
end
