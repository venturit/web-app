class RefactoringDataColumns < ActiveRecord::Migration
  def up
    rename_column :data, :phi2_raw, :data_raw
    remove_column :data, :subject
  end

  def down
    rename_column :data, :data_raw, :phi2_raw
    add_column :data, :subject, :string
  end
end
