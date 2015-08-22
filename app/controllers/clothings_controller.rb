class ClothingsController < ApplicationController
  before_action :set_clothing, only: [:show]

  # GET /clothings
  # GET /clothings.json
  def index
    @clothings = Clothing.retrieve_all
  end

  # GET /clothings/1
  # GET /clothings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.retrieve(params[:id])
    end
end
