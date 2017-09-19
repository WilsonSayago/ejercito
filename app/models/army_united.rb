class ArmyUnited < ApplicationRecord
  belongs_to :army
  belongs_to :united
  has_many :army_uniteds_training
  has_many :trainings, through: :army_uniteds_training

  validates :cantidad, presence: true

  def calcular_puntos
    puntos = self.united.points
    self.army_uniteds_training.each do |e|
      puntos = puntos + e.training.puntos_obtenidos
    end
    return puntos
  end

  def entrenamiento
    army = self.army
    entrenamiento = self.united.training
    army.update(saldo: (army.saldo - entrenamiento.costo))
    ArmyUnitedsTraining.create(army_united: self, training: entrenamiento)
  end
end
