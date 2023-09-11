class TableEmployeesController < ApplicationController
  before_action :set_raw_material, only: %i[ show edit update destroy ]

  # GET /raw_materials or /raw_materials.json
  def index
    @table_employees = TableEmployee.all.order(id: :desc)

    if params[:product_name].present?
      @table_employees = @table_employees.where("table_employees.nom ilike '%#{params[:nom]}%' or table_employees.titre_poste ilike '%#{params[:nom]}%'")
    
      compagnie_name_like = TableEmployee.arel_table["nom"]
      compagnie_type_like = TableEmployee.arel_table["titre_poste"]
      @table_employees = @table_employees.where(compagnie_name_like.matches("%#{params[:nom]}%")).or(@table_employees.where(compagnie_type_like.matches("%#{params[:nom]}%")))

    
    end

    options = {page: params[:page] || 1, per_page:3}
    @table_employees = @table_employees.paginate(options)
  end

  # GET /raw_materials/1 or /raw_materials/1.json

  def show  
  end

  # GET /raw_materials/new
  def new
    @table_employee = TableEmployee.new
  end

  # GET /raw_materials/1/edit
  def edit
  end

  # POST /raw_materials or /raw_materials.json
  def create
    @table_employee = TableEmployee.new(table_employee_params)

    respond_to do |format|
      if @table_employee.save
        format.html { redirect_to table_employees_path(@table_employee), notice: "Compagnie a été créee" }
        format.json { render :show, status: :created, location: @table_employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @table_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_materials/1 or /raw_materials/1.json
  def update
    respond_to do |format|
      if @table_employee.update(table_employee_params)
        format.html { redirect_to table_employees_path(@table_employee), notice: "Compagnie a été mise-à-jour" }
        format.json { render :show, status: :ok, location: @table_employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1 or /raw_materials/1.json
  def destroy
    @table_employee.destroy

    respond_to do |format|
      format.html { redirect_to table_employees_url, notice: "Raw material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material
      @table_employee = TableEmployee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def table_employee_params
      params.require(:table_employee).permit(:nom, :titre_poste, :responsabilite, :exigence, :experience, :profil_competence, :besoin_marche)
    end
end
