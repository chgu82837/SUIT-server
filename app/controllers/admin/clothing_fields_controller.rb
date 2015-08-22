class Admin::ClothingFieldsController < Admin::BaseController
  before_action :set_clothing_field, only: [:show, :edit, :update, :destroy]

  # GET /clothing_fields
  # GET /clothing_fields.json
  def index
    @clothing_fields = ClothingField.all
  end

  # GET /clothing_fields/1
  # GET /clothing_fields/1.json
  def show
  end

  # GET /clothing_fields/new
  def new
    @clothing_field = ClothingField.new
  end

  # GET /clothing_fields/1/edit
  def edit
  end

  # POST /clothing_fields
  # POST /clothing_fields.json
  def create
    @clothing_field = ClothingField.new(clothing_field_params)

    respond_to do |format|
      if @clothing_field.save
        format.html { redirect_to admin_clothing_field_path(@clothing_field), notice: 'Clothing field was successfully created.' }
        format.json { render :show, status: :created, location: admin_clothing_field_path(@clothing_field) }
      else
        format.html { render :new }
        format.json { render json: @clothing_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothing_fields/1
  # PATCH/PUT /clothing_fields/1.json
  def update
    respond_to do |format|
      if @clothing_field.update(clothing_field_params)
        format.html { redirect_to admin_clothing_field_path(@clothing_field), notice: 'Clothing field was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_clothing_field_path(@clothing_field) }
      else
        format.html { render :edit }
        format.json { render json: @clothing_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothing_fields/1
  # DELETE /clothing_fields/1.json
  def destroy
    @clothing_field.destroy
    respond_to do |format|
      format.html { redirect_to admin_clothing_fields_path, notice: 'Clothing field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing_field
      @clothing_field = ClothingField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothing_field_params
      params.require(:clothing_field).permit(:name, :type, :func)
    end
end
