class ConfigSetValuesController < ApplicationController
  before_action :set_config_set_value, only: [:show, :edit, :update, :destroy]

  swagger_controller :set_config_set_values, "ConfigSetValues"

  # GET /config_set_values
  # GET /config_set_values.json
  def index
    @config_set_values = ConfigSetValue.all
  end

  # GET /config_set_values/1
  # GET /config_set_values/1.json
  def show
  end

  # GET /config_set_values/new
  def new
    @config_set_value = ConfigSetValue.new
  end

  # GET /config_set_values/1/edit
  def edit
  end

  # POST /config_set_values
  # POST /config_set_values.json
  def create
    @config_set_value = ConfigSetValue.new(config_set_value_params)

    respond_to do |format|
      if @config_set_value.save
        format.html { redirect_to @config_set_value, notice: 'Config set value was successfully created.' }
        format.json { render :show, status: :created, location: @config_set_value }
      else
        format.html { render :new }
        format.json { render json: @config_set_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_set_values/1
  # PATCH/PUT /config_set_values/1.json
  def update
    respond_to do |format|
      if @config_set_value.update(config_set_value_params)
        format.html { redirect_to @config_set_value, notice: 'Config set value was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_set_value }
      else
        format.html { render :edit }
        format.json { render json: @config_set_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_set_values/1
  # DELETE /config_set_values/1.json
  def destroy
    @config_set_value.destroy
    respond_to do |format|
      format.html { redirect_to config_set_values_url, notice: 'Config set value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_set_value
      @config_set_value = ConfigSetValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_set_value_params
      params.require(:config_set_value).permit(:key, :value, :status, :data_type, :config_set_id, :organization_id, :deleted_at, :expired_at)
    end
end
