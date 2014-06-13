class ConfigSetsController < ApplicationController
  before_action :set_config_set, only: [:show, :edit, :update, :destroy]

  # GET /config_sets
  # GET /config_sets.json
  def index
    @config_sets = ConfigSet.all
  end

  # GET /config_sets/1
  # GET /config_sets/1.json
  def show
  end

  # GET /config_sets/new
  def new
    @config_set = ConfigSet.new
  end

  # GET /config_sets/1/edit
  def edit
  end

  # POST /config_sets
  # POST /config_sets.json
  def create
    @config_set = ConfigSet.new(config_set_params)

    respond_to do |format|
      if @config_set.save
        format.html { redirect_to @config_set, notice: 'Config set was successfully created.' }
        format.json { render :show, status: :created, location: @config_set }
      else
        format.html { render :new }
        format.json { render json: @config_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_sets/1
  # PATCH/PUT /config_sets/1.json
  def update
    respond_to do |format|
      if @config_set.update(config_set_params)
        format.html { redirect_to @config_set, notice: 'Config set was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_set }
      else
        format.html { render :edit }
        format.json { render json: @config_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_sets/1
  # DELETE /config_sets/1.json
  def destroy
    @config_set.destroy
    respond_to do |format|
      format.html { redirect_to config_sets_url, notice: 'Config set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_set
      @config_set = ConfigSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_set_params
      params.require(:config_set).permit(:name, :config_type, :deleted_at, :expired_at)
    end
end
