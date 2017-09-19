class CreateCivilizations < ActiveRecord::Migration[5.1]
  def change
    create_table :civilizations do |t|
      t.string :name
      t.integer :piqueros
      t.integer :arqueros
      t.integer :caballero

      t.timestamps
    end
  end
end
