class CreateTransformations < ActiveRecord::Migration[5.1]
  def change
    create_table :transformations do |t|
      t.references :united, foreign_key: true
      t.string :unidad_convertir
      t.integer :costo

      t.timestamps
    end
  end
end
