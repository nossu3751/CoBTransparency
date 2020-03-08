class StudyAreasController < ApplicationController
  before_action :set_study_area, only: [:show, :edit, :update, :destroy]

  # GET /study_areas
  # GET /study_areas.json
  def index
    @study_areas = StudyArea.all
    @neighborhoods = 'https://gist.githubusercontent.com/nossu3751/3a92073b0333314e360185906d56772f/raw/3e86f1b621080aa431593b334114d4c0f9479b71/neighborhoods.geojson'
    @layerInfo = layerInfoBuilder
  end

  # GET /study_areas/1
  # GET /study_areas/1.json
  def show
  end

  # GET /study_areas/new
  def new
    @study_area = StudyArea.new
  end

  # GET /study_areas/1/edit
  def edit
  end

  # POST /study_areas
  # POST /study_areas.json
  def create
    @study_area = StudyArea.new(study_area_params)

    respond_to do |format|
      if @study_area.save
        format.html { redirect_to @study_area, notice: 'Study area was successfully created.' }
        format.json { render :show, status: :created, location: @study_area }
      else
        format.html { render :new }
        format.json { render json: @study_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_areas/1
  # PATCH/PUT /study_areas/1.json
  def update
    respond_to do |format|
      if @study_area.update(study_area_params)
        format.html { redirect_to @study_area, notice: 'Study area was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_area }
      else
        format.html { render :edit }
        format.json { render json: @study_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_areas/1
  # DELETE /study_areas/1.json
  def destroy
    @study_area.destroy
    respond_to do |format|
      format.html { redirect_to study_areas_url, notice: 'Study area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_area
      @study_area = StudyArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_area_params
      params.require(:study_area).permit(:location)
    end

    def layerInfoBuilder
      layers = [
          {"layerID" => "sensor_loc", "layerName" => "Clusters"},
          {"layerID" => "unclustered-point", "layerName" => "Sensors"},
          {"layerID" => "sensor_loc_count", "layerName" => "# of Sensors"},
          {"layerID" => "neighborhood_fill", "layerName" => "Boston Neighborhoods"},
          {"layerID" => "neighborhood_line", "layerName" => "Neighborhood Boundaries"}
      ]   
  end
end
