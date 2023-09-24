class ChangeDescriptionToTitleInExperiences < ActiveRecord::Migration[7.0]
  def change
    rename_column :experiences, :description, :title
  end
end
