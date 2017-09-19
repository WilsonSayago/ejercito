class Civilization < ApplicationRecord
  CIVILIZACIONES = [
    {name: "chinos", piqueros: 2, arqueros: 25,caballero: 2},
    {name: "ingleses", piqueros: 10, arqueros: 10,caballero: 10},
    {name: "bizantinos", piqueros: 5, arqueros: 8,caballero: 15}
  ]

  has_many :armies
end
