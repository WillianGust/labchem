class RawMaterialsController < ApplicationController
  before_action :set_raw_material, only: %i[ show edit update destroy ]

  # GET /raw_materials or /raw_materials.json
  def index
    @raw_materials = RawMaterial.all

    if params[:product_name].present?
      # @raw_materials = @raw_materials.where("raw_materials.product_name ilike '%#{params[:product_name]}%' or raw_materials.product_type ilike '%#{params[:product_name]}%'")
    
      product_name_like = RawMaterial.arel_table["product_name"]
      product_type_like = RawMaterial.arel_table["product_type"]
      @raw_materials = @raw_materials.where(product_name_like.matches("%#{params[:product_name]}%")).or(@raw_materials.where(product_type_like.matches("%#{params[:product_name]}%")))

    
    end

    options = {page: params[:page] || 1, per_page:2}
    @raw_materials = @raw_materials.paginate(options)
  end

  # GET /raw_materials/1 or /raw_materials/1.json

  def show  
  end

  # GET /raw_materials/new
  def new
    @raw_material = RawMaterial.new
  end

  # GET /raw_materials/1/edit
  def edit
  end

  # POST /raw_materials or /raw_materials.json
  def create
    @raw_material = RawMaterial.new(raw_material_params)

    respond_to do |format|
      if @raw_material.save
        format.html { redirect_to raw_materials_path(@raw_material), notice: "Raw material was successfully created." }
        format.json { render :show, status: :created, location: @raw_material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_materials/1 or /raw_materials/1.json
  def update
    respond_to do |format|
      if @raw_material.update(raw_material_params)
        format.html { redirect_to raw_materials_path(@raw_material), notice: "Raw material was successfully updated." }
        format.json { render :show, status: :ok, location: @raw_material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1 or /raw_materials/1.json
  def destroy
    @raw_material.destroy

    respond_to do |format|
      format.html { redirect_to raw_materials_url, notice: "Raw material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material
      @raw_material = RawMaterial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raw_material_params
      params.require(:raw_material).permit(:product_name, :product_type, :volume_solid, :weight_solid, :volatile_organic_compound, :pigment_volume_concentration, :density, :price)
    end
end
