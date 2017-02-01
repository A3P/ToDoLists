class TodoListBelongsToUser < ActiveRecord::Migration
  def change
  	add_reference :todo_lists, :user
  end
end
