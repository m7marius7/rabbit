class AddMetaTitleToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :meta_title, :string
  end
end
