class AddTrainings < ActiveRecord::Migration[5.1]
  def up
    Training::ENTRENAMIENTO.each do |e|
      Training.create(e)
    end
  end

  def down
    Training.delete_all
  end
end
