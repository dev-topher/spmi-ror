class CreateCareers < ActiveRecord::Migration[7.0]
  def change
    create_table :careers do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.string :city, null: false
      t.integer :credits, null: false
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end