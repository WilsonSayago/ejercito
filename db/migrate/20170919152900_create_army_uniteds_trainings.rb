class CreateArmyUnitedsTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :army_uniteds_trainings do |t|
      t.references :army_united, foreign_key: true
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
