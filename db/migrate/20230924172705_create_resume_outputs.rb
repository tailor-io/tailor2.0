class CreateResumeOutputs < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_outputs do |t|
      t.string :company_url

      t.timestamps
    end
  end
end
