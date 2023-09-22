class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :status_program, null: false, default: 1

      t.timestamps
    end
  end
end
