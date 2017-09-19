class Army < ApplicationRecord
  belongs_to :civilization
  has_many :army_united
  has_many :uniteds, through: :army_united
  has_many :records

  validates :civilization, presence: true
  validates :saldo, presence: true
  validates :name, presence: true, uniqueness: {scope: :civilization_id}

  after_create :cargar_unidades

  def cargar_unidades
    civilizacion = self.civilization
    ArmyUnited.create(army_id: self.id, united_id: 1, cantidad: civilization.piqueros)
    ArmyUnited.create(army_id: self.id, united_id: 2, cantidad: civilization.arqueros)
    ArmyUnited.create(army_id: self.id, united_id: 3, cantidad: civilization.caballero)
  end

  def puntos_totales
    puntos = 0
    self.army_united.each do |a_u|
      puntos = puntos + ( a_u.cantidad * a_u.calcular_puntos )
    end
    return puntos
  end

  def perdedor
    mayor_id_1 = nil
    mayor_id_2 = nil
    cantidad_mayor_1 = 0
    cantidad_mayor_2 = 0
    self.army_united.each do |a_u|
      if (a_u.calcular_puntos*a_u.cantidad) > cantidad_mayor_1
        if mayor_id_1.present?
          mayor_id_2 = mayor_id_1
          cantidad_mayor_2 = cantidad_mayor_1
        end
        mayor_id_1 = a_u.united.id
        cantidad_mayor_1 = a_u.calcular_puntos*a_u.cantidad
      elsif (a_u.calcular_puntos*a_u.cantidad) > cantidad_mayor_2
        mayor_id_2 = a_u.united.id
        cantidad_mayor_2 = a_u.calcular_puntos*a_u.cantidad
      end
    end
    a_u = self.army_united.where(united_id: mayor_id_1)
    a_u.update(cantidad: 0)
    a_u = self.army_united.where(united_id: mayor_id_2)
    a_u.update(cantidad: 0)
  end
end
