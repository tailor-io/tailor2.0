class AddUserUuid < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_infos, :user_id, :string
  end
end
