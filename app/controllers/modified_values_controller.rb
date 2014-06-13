class ModifiedValuesController < ApplicationController
  before_action :set_modified_value, only: [:show, :edit, :update, :destroy]

  # GET /modified_values
  # GET /modified_values.json
  def index
    @modified_values = ModifiedValue.all
  end

  # GET /modified_values/1
  # GET /modified_values/1.json
  def show
  end

  # GET /modified_values/new
  def new
    @modified_value = ModifiedValue.new
  end

  # GET /modified_values/1/edit
  def edit
  end

  # POST /modified_values
  # POST /modified_values.json
  def create
    @modified_value = ModifiedValue.new(modified_value_params)

    respond_to do |format|
      if @modified_value.save
        format.html { redirect_to @modified_value, notice: 'Modified value was successfully created.' }
        format.json { render :show, status: :created, location: @modified_value }
      else
        format.html { render :new }
        format.json { render json: @modified_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modified_values/1
  # PATCH/PUT /modified_values/1.json
  def update
    respond_to do |format|
      if @modified_value.update(modified_value_params)
        format.html { redirect_to @modified_value, notice: 'Modified value was successfully updated.' }
        format.json { render :show, status: :ok, location: @modified_value }
      else
        format.html { render :edit }
        format.json { render json: @modified_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modified_values/1
  # DELETE /modified_values/1.json
  def destroy
    @modified_value.destroy
    respond_to do |format|
      format.html { redirect_to modified_values_url, notice: 'Modified value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modified_value
      @modified_value = ModifiedValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modified_value_params
      params.require(:modified_value).permit(:key, :value, :status, :organization_id, :service_id)
    end
end
