class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.integer :rut, null: false
      t.string :name, null: false
      t.integer :enrollment, null: false
      t.date :born_date, null: false
      t.boolean :regular_student, null: false
      t.integer :credits_approved, null: false
      t.integer :failed_subjects, null: false
      t.boolean :has_debts, null: false
      t.boolean :has_intern_debts, null: false
      t.references :career, foreign_key: true
    
      t.timestamps
    end
  end
end
