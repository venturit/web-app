class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :value
      t.string :label
      t.string :options
      t.integer :project_id

      t.timestamps
    end
  end
end
