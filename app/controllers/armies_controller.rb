class ArmiesController < ApplicationController
  before_action :set_civilization
  before_action :set_army, only: [:show, :atacar]

  def atacar
    @oponente = Army.find(params[:oponente])
    puts @army.to_json
    puts @oponente.to_json
    if @army.puntos_totales > @oponente.puntos_totales
      @army.update(saldo: (@army.saldo + 100))
      @oponente.perdedor
      flash[:notice] = "Has ganado la batalla"
      Record.create(army_id: @army.id, oponente: @oponente.id,estatus: "Ganado")
    elsif @army.puntos_totales == @oponente.puntos_totales
      a_u = @army.army_united.where(united_id: 2)
      a_u.update(cantidad: 0)
      a_u = @oponente.army_united.where(united_id: 2)
      a_u.update(cantidad: 0)
      flash[:notice] = "Has empatado la batalla"
      Record.create(army_id: @army.id, oponente: @oponente.id,estatus: "Empatado")
    else
      flash[:notice] = "Has perdido la batalla"
      @army.perdedor
      @oponente.update(saldo: (@oponente.saldo + 100))
      Record.create(army_id: @army.id, oponente: @oponente.id,estatus: "Perdido")
    end
    redirect_to civilization_army_path(civilization_id: @army.civilization, id: @army)
  end

  # GET /armies/1
  # GET /armies/1.json
  def show
    @armies = Army.all.where.not(id: @army)
  end

  # GET /armies/new
  def new
    @army = Army.new
  end

  # POST /armies
  # POST /armies.json
  def create
    @army = Army.new(army_params)
    @army.civilization = @civilization
    respond_to do |format|
      if @army.save
        format.html { redirect_to civilization_army_path(civilization_id: @civilization, id: @army), notice: 'Army was successfully created.' }
        format.json { render :show, status: :created, location: @army }
      else
        format.html { render :new }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_civilization
      @civilization = Civilization.find(params[:civilization_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_army
      @army = Army.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def army_params
      params.require(:army).permit(:civilization_id, :saldo, :name)
    end
end
