class CivilizationsController < ApplicationController
  before_action :set_civilization, only: [:show]

  # GET /civilizations
  # GET /civilizations.json
  def index
    @civilizations = Civilization.all
  end

  # GET /civilizations/1
  # GET /civilizations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_civilization
      @civilization = Civilization.find(params[:id])
    end
end
