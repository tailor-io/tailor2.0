class AddDescriptionToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :description, :string
  end
end
