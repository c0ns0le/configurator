class ServiceDefaultValuesController < ApplicationController
respond_to :json
  before_action :set_service_default_value, only: [:show, :edit, :update, :destroy]

  # GET /service_default_values
  # GET /service_default_values.json
  def index
    @service_default_values = ServiceDefaultValue.all
  end

  # GET /service_default_values/1
  # GET /service_default_values/1.json
  def show
  end

  # GET /service_default_values/new
  def new
    @service_default_value = ServiceDefaultValue.new
  end

  # GET /service_default_values/1/edit
  def edit
  end

  # POST /service_default_values
  # POST /service_default_values.json
  def create
    @service_default_value = ServiceDefaultValue.new(service_default_value_params)

    respond_to do |format|
      if @service_default_value.save
        format.html { redirect_to @service_default_value, notice: 'Service default value was successfully created.' }
        format.json { render :show, status: :created, location: @service_default_value }
      else
        format.html { render :new }
        format.json { render json: @service_default_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_default_values/1
  # PATCH/PUT /service_default_values/1.json
  def update
    respond_to do |format|
      if @service_default_value.update(service_default_value_params)
        format.html { redirect_to @service_default_value, notice: 'Service default value was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_default_value }
      else
        format.html { render :edit }
        format.json { render json: @service_default_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_default_values/1
  # DELETE /service_default_values/1.json
  def destroy
    @service_default_value.destroy
    respond_to do |format|
      format.html { redirect_to service_default_values_url, notice: 'Service default value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_default_value
      @service_default_value = ServiceDefaultValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_default_value_params
      params.require(:service_default_value).permit(:key, :value, :status, :deleted_at, :expired_at, :service_id)
    end
end
