class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :name, null: false
      t.date :f_inicio, null: false
      t.date :f_fin, null: false
      t.integer :status, null: false, default: 1
      t.integer :min_creditos_sct, null: false
      t.integer :max_creditos_sct, null: false
      t.integer :ramos_reprobados, null: false
      t.boolean :notificacion, null: false, default: false

      t.references :program, foreign_key: true
    end
  end
end
