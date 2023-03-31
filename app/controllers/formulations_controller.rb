class FormulationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_formulation, only: %i[ show edit update destroy ]

  # GET /formulations or /formulations.json
  def index
    @formulations = Formulation.all.order(updated_at: :desc)
  end

  # GET /formulations/1 or /formulations/1.json
  def show
  end

  # GET /formulations/new
  def new
    @formulation = Formulation.new
  end

  # GET /formulations/1/edit
  def edit
  end

  # POST /formulations or /formulations.json
  def create
    @formulation = Formulation.new(formulation_params)

    respond_to do |format|
      if @formulation.save
        format.html { redirect_to formulations_path(@formulation), notice: "Formulation was successfully created." }
        format.json { render :show, status: :created, location: @formulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulations/1 or /formulations/1.json
  def update
    respond_to do |format|
      if @formulation.update(formulation_params)
        format.html { redirect_to formulations_path(@formulation), notice: "Formulation was successfully updated." }
        format.json { render :show, status: :ok, location: @formulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulations/1 or /formulations/1.json
  def destroy
    @formulation.destroy

    respond_to do |format|
      format.html { redirect_to formulations_url, notice: "Formulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulation
      @formulation = Formulation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formulation_params
      params.require(:formulation).permit(:project_name, :description)
    end
end
