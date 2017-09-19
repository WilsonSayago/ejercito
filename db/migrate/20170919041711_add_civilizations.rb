class AddCivilizations < ActiveRecord::Migration[5.1]
  def up
    Civilization::CIVILIZACIONES.each do |c|
      Civilization.create(c)
    end
  end

  def down
    Civilization.delete_all
  end
end
