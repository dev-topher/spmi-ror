class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      
      t.string :language, null: false

    end
  end
end
