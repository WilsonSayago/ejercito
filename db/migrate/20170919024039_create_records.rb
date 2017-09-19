class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :army, foreign_key: true
      t.string :estatus
      t.integer :oponente

      t.timestamps
    end
  end
end
