class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :area, null: false
      t.references :users, null: false, foreign_key: true
      t.timestamps
    end
  end
end
