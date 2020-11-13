class AddTaskToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :task_id, :bigint, null: false

    add_foreign_key :comments, :tasks
  end
end
