class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      add_column :experiences, :description, :string
      t.timestamps
    end
  end
end
