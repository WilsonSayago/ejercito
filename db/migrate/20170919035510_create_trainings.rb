class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.references :united, foreign_key: true
      t.integer :puntos_obtenidos
      t.integer :costo

      t.timestamps
    end
  end
end
