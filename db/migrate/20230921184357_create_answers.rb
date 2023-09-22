class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :apply, foreign_key: true
    end
  end
end
