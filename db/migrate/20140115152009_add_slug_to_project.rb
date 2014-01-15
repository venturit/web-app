class AddSlugToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cached_slug, :string
    add_index :projects, :cached_slug
  end
end
