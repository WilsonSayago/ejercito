class United < ApplicationRecord
  UNIDADES = [
    {name: "piquero", points: 5},
    {name: "arquero", points: 10},
    {name: "caballero", points: 20}
  ]
  has_one :training
  has_one :transformation
end
