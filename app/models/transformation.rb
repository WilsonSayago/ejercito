class Transformation < ApplicationRecord
  belongs_to :united

  TRANSFORMACION = [
    {united_id: 1, unidad_convertir: 2, costo: 30},
    {united_id: 2, unidad_convertir: 3, costo: 40},
    {united_id: 3, unidad_convertir: nil, costo: nil}
  ]
end
