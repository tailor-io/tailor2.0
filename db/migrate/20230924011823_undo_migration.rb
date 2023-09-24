class UndoMigration < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :description, :string
  end
end
