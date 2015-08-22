class Admin::UserChoisesController < Admin::BaseController
  before_action :set_user_choise, only: [:show, :edit, :update, :destroy]

  # GET /user_choises
  # GET /user_choises.json
  def index
    @user_choises = UserChoise.all
  end

  # GET /user_choises/1
  # GET /user_choises/1.json
  def show
  end

  # GET /user_choises/new
  def new
    @user_choise = UserChoise.new
  end

  # GET /user_choises/1/edit
  def edit
  end

  # POST /user_choises
  # POST /user_choises.json
  def create
    @user_choise = UserChoise.new(user_choise_params)

    respond_to do |format|
      if @user_choise.save
        format.html { redirect_to admin_user_choise_path(@user_choise), notice: 'User choise was successfully created.' }
        format.json { render :show, status: :created, location: admin_user_choise_path(@user_choise) }
      else
        format.html { render :new }
        format.json { render json: @user_choise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_choises/1
  # PATCH/PUT /user_choises/1.json
  def update
    respond_to do |format|
      if @user_choise.update(user_choise_params)
        format.html { redirect_to admin_user_choise_path(@user_choise), notice: 'User choise was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_user_choise_path(@user_choise) }
      else
        format.html { render :edit }
        format.json { render json: @user_choise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_choises/1
  # DELETE /user_choises/1.json
  def destroy
    @user_choise.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_choises_path, notice: 'User choise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_choise
      @user_choise = UserChoise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_choise_params
      params.require(:user_choise).permit(:user_id, :clothing_id, :liked, :time)
    end
end
