class Datum < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :device_version, :photosynthetic_efficiency_phi2, :data_raw, :fs, :fm, :baseline, :co2_raw, :co2_slope, :co2_start, :co2_end, :co2_drop, :light_intensity, :blue, :green, :red, :led_low, :led_high, :ir_low, :ir_high,:co2_content, :created_at, :relative_humidity, :tags, :temperature,:user_id  
def tags=(tags)
  # TODO: tags
end

end
