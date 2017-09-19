class CreateArmies < ActiveRecord::Migration[5.1]
  def change
    create_table :armies do |t|
      t.references :civilization, foreign_key: true
      t.integer :saldo, default: 1000
      t.string :name

      t.timestamps
    end
  end
end
