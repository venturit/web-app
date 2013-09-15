class RefactorDataAttributes < ActiveRecord::Migration
  def up
    add_column :data, :device_version, :integer
    add_column :data, :led_low, :integer
    add_column :data, :led_high, :integer
    add_column :data, :ir_low, :integer
    add_column :data, :ir_high, :integer
    add_column :data, :baseline, :integer
    add_column :data, :phi2_raw, :text
    add_column :data, :fm, :float
    add_column :data, :co2_slope, :float
    add_column :data, :co2_start, :integer
    add_column :data, :co2_end, :integer
    add_column :data, :co2_drop, :integer
    add_column :data, :light_intensity, :integer
    add_column :data, :red, :integer
    add_column :data, :blue, :integer
    add_column :data, :green, :integer
    
    rename_column :data, :photosynthetic_efficiency, :photosynthetic_efficiency_phi2
    rename_column :data, :relative_chlorophyll_content, :fs
    rename_column :data, :raw, :co2_raw
  end

  def down
      remove_column :data, :led_low
      remove_column :data, :led_high
      remove_column :data, :ir_low
      remove_column :data, :ir_high
      remove_column :data, :baseline
      remove_column :data, :phi2_raw
      remove_column :data, :fm
      remove_column :data, :co2_slope
      remove_column :data, :co2_start
      remove_column :data, :co2_end
      remove_column :data, :co2_drop
      remove_column :data, :light_intensity
      remove_column :data, :red
      remove_column :data, :blue
      remove_column :data, :green
      
      rename_column :data, :photosynthetic_efficiency_phi2, :photosynthetic_efficiency
      rename_column :data, :fs, :relative_chlorophyll_content
      rename_column :data, :co2_raw, :raw
      
  end
end

