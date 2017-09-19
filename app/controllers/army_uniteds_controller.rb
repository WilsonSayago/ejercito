class ArmyUnitedsController < ApplicationController

  def entrenamiento
    @army_united = ArmyUnited.find(params[:id])
    @army_united.entrenamiento
    redirect_to civilization_army_path(civilization_id: @army_united.army.civilization, id: @army_united.army)
  end
end
