class AddCompletedAtToTodoLists < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :completed_at, :datetime
  end
end
