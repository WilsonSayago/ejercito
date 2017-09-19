class Record < ApplicationRecord
  belongs_to :army#, :class_name => 'Army'

  def get_oponente
    Army.find(self.oponente)
  end

end
