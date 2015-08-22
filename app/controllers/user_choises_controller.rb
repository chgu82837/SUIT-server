class UserChoisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_choise, only: [:show]

  # GET /user_choises
  # GET /user_choises.json
  def index
    @user_choises = current_user.user_choises
    @clothings = Clothing.retrieve(@user_choises.pluck(:clothing_id).uniq)
  end

  # GET /user_choises/1
  # GET /user_choises/1.json
  def show
  end

  # GET /user_choises/new
  def new
    @user_choise = UserChoise.new
  end

  # POST /user_choises
  # POST /user_choises.json
  def create
    @user_choise = UserChoise.new(user_choise_params)
    @user_choise.user = current_user
    @user_choise.time = DateTime.now

    respond_to do |format|
      if @user_choise.save
        wardrobe = Wardrobe.where(clothing_id: @user_choise.clothing_id).first
        wardrobe.chosen += 1
        clothing = Clothing.find(@user_choise.clothing_id)
        clothing.chosen += 1
        if wardrobe.save && clothing.save
          format.html { redirect_to @user_choise, notice: 'User choise was successfully created.' }
        else
          format.html { redirect_to @user_choise, notice: 'chosen failed to increase' }
        end
        format.json { render :show, status: :created, location: @user_choise }
      else
        format.html { render :new }
        format.json { render json: @user_choise.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_choise
      @user_choise = current_user.user_choises.find(params[:id])
      @clothing = Clothing.retrieve(@user_choise.clothing_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_choise_params
      params.require(:user_choise).permit(:clothing_id, :liked)
    end
end
