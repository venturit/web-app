class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :disclaimer
      t.integer :views
      t.integer :downloads
      t.integer :lead_id
      t.string  :location
      t.float   :latitude
      t.float   :longitude
      t.datetime :start_date
      t.datetime :end_date
      t.time :start_time
      t.time :end_time
      t.boolean  :is_open
      t.timestamps
    end
  end
end
