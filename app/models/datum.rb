class Datum < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :project_id, :user_id,:co2_content, :created_at, :photosynthetic_efficiency, :raw, :relative_chlorophyll_content, :relative_humidity, :subject, :temperature
end
