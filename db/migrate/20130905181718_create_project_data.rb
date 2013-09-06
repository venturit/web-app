class CreateProjectData < ActiveRecord::Migration
  def change
    create_table :project_data do |t|
      t.integer :user_id
      t.integer :project_id
      t.float :photosynthetic_efficiency
      t.float :relative_chlorophyll_content
      t.float :temperature
      t.float :relative_humidity
      t.float :co2_content
      t.float :longitude 
      t.float :latitude
      t.text :raw
      t.string :subject
      t.timestamps
    end
  end
end
