class AddBetaFlagToProject < ActiveRecord::Migration
  def change
    add_column :projects, :beta, :boolean
  end
end
