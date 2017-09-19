class CreateArmyUniteds < ActiveRecord::Migration[5.1]
  def change
    create_table :army_uniteds do |t|
      t.references :army, foreign_key: true
      t.references :united, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
