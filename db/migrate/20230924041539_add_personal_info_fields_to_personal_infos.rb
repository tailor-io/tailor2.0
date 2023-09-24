class AddPersonalInfoFieldsToPersonalInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_infos, :first_name, :string
    add_column :personal_infos, :last_name, :string
    add_column :personal_infos, :city, :string
    add_column :personal_infos, :state, :string
    add_column :personal_infos, :phone, :string
  end
end
