class Admin::ClothingAttrsController < Admin::BaseController
  before_action :set_clothing_attr, only: [:show, :edit, :update, :destroy]

  # GET /clothing_attrs
  # GET /clothing_attrs.json
  def index
    @clothing_attrs = ClothingAttr.all
  end

  # GET /clothing_attrs/1
  # GET /clothing_attrs/1.json
  def show
  end

  # GET /clothing_attrs/new
  def new
    @clothing_attr = ClothingAttr.new
  end

  # GET /clothing_attrs/1/edit
  def edit
  end

  # POST /clothing_attrs
  # POST /clothing_attrs.json
  def create
    @clothing_attr = ClothingAttr.new(clothing_attr_params)

    respond_to do |format|
      if @clothing_attr.save
        format.html { redirect_to admin_clothing_attr_path(@clothing_attr), notice: 'Clothing attr was successfully created.' }
        format.json { render :show, status: :created, location: admin_clothing_attr_path(@clothing_attr) }
      else
        format.html { render :new }
        format.json { render json: @clothing_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothing_attrs/1
  # PATCH/PUT /clothing_attrs/1.json
  def update
    respond_to do |format|
      if @clothing_attr.update(clothing_attr_params)
        format.html { redirect_to admin_clothing_attr_path(@clothing_attr), notice: 'Clothing attr was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_clothing_attr_path(@clothing_attr) }
      else
        format.html { render :edit }
        format.json { render json: @clothing_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothing_attrs/1
  # DELETE /clothing_attrs/1.json
  def destroy
    @clothing_attr.destroy
    respond_to do |format|
      format.html { redirect_to admin_clothing_attrs_url, notice: 'Clothing attr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing_attr
      @clothing_attr = ClothingAttr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothing_attr_params
      params.require(:clothing_attr).permit(:clothing_field_id, :clothing_id, :value)
    end
end
