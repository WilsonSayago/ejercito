class Training < ApplicationRecord
  belongs_to :united
  has_many :army_uniteds_trainings

  ENTRENAMIENTO = [
    {united_id: 1, puntos_obtenidos: 3, costo: 10},
    {united_id: 2, puntos_obtenidos: 7, costo: 20},
    {united_id: 3, puntos_obtenidos: 10, costo: 30}
  ]

end
