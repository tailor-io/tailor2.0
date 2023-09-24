class CreateExperienceDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_descriptions do |t|
      t.text :content
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
