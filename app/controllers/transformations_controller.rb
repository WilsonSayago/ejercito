class TransformationsController < ApplicationController

  def index
    @army_united = ArmyUnited.find(params[:id])
    @army = @army_united.army
    @civilization = @army.civilization
  end

  def update
    cantidad = params[:cantidad]
    @army_united = ArmyUnited.find(params[:id])
    transformacion = @army_united.united.transformation
    army = @army_united.army
    if (army.saldo - (transformacion.costo*cantidad.to_i)) >= 0
      nueva_cantidad = @army_united.cantidad - cantidad.to_i
      if nueva_cantidad >= 0
        @army_united.update(cantidad: nueva_cantidad)

        @army_united = ArmyUnited.find_by(united_id: transformacion.unidad_convertir, army_id: @army_united.army.id)
        nueva_cantidad = @army_united.cantidad + cantidad.to_i
        @army_united.update(cantidad: nueva_cantidad)

        army.update(saldo: (army.saldo - (transformacion.costo*cantidad.to_i)))
        flash[:notice] = "Unidades mejorasdas con exito"
        redirect_to civilization_army_path(civilization_id: @army_united.army.civilization, id: @army_united.army)
      else
        flash[:notice] = "Cantidad mayor a la disponible"
        @army = @army_united.army
        @civilization = @army.civilization
        render :index
      end
    else
      @army = @army_united.army
      @civilization = @army.civilization
      flash[:notice] = "Saldo insuficiente"
      render :index
    end
  end
end
