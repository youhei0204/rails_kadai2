class AddColumnToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :introduction, :text
  end
end
