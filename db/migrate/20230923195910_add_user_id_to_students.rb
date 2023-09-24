class AddUserIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :user_id, :integer, null: false
  end
end
