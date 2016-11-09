class LevelofstudiesController < ApplicationController
  before_action :set_levelofstudy, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /levelofstudies
  # GET /levelofstudies.json
  def index
    @levelofstudies = Levelofstudy.all
  end

  # GET /levelofstudies/1
  # GET /levelofstudies/1.json
  def show
  end

  # GET /levelofstudies/new
  def new
    @levelofstudy = Levelofstudy.new
  end

  # GET /levelofstudies/1/edit
  def edit
  end

  # POST /levelofstudies
  # POST /levelofstudies.json
  def create
    @levelofstudy = Levelofstudy.new(levelofstudy_params)

    respond_to do |format|
      if @levelofstudy.save
        format.html { redirect_to @levelofstudy, notice: 'Levelofstudy was successfully created.' }
        format.json { render :show, status: :created, location: @levelofstudy }
      else
        format.html { render :new }
        format.json { render json: @levelofstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levelofstudies/1
  # PATCH/PUT /levelofstudies/1.json
  def update
    respond_to do |format|
      if @levelofstudy.update(levelofstudy_params)
        format.html { redirect_to @levelofstudy, notice: 'Levelofstudy was successfully updated.' }
        format.json { render :show, status: :ok, location: @levelofstudy }
      else
        format.html { render :edit }
        format.json { render json: @levelofstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levelofstudies/1
  # DELETE /levelofstudies/1.json
  def destroy
    @levelofstudy.destroy
    respond_to do |format|
      format.html { redirect_to levelofstudies_url, notice: 'Levelofstudy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_levelofstudy
      @levelofstudy = Levelofstudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def levelofstudy_params
      params.require(:levelofstudy).permit(:levelname)
    end
end
