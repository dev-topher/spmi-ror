class CreateDetailColleges < ActiveRecord::Migration[7.0]
  def change
    create_table :detail_colleges do |t|
      t.references :college, foreign_key: true
      t.references :program, foreign_key: true
    end
  end
end
