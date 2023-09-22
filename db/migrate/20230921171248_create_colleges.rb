class CreateColleges < ActiveRecord::Migration[7.0]
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.boolean :status_college, null: false, default: true
    end
  end
end
