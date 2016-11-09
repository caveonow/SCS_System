class YearofstudiesController < ApplicationController
  before_action :set_yearofstudy, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /yearofstudies
  # GET /yearofstudies.json
  def index
    @yearofstudies = Yearofstudy.all
  end

  # GET /yearofstudies/1
  # GET /yearofstudies/1.json
  def show
  end

  # GET /yearofstudies/new
  def new
    @yearofstudy = Yearofstudy.new
  end

  # GET /yearofstudies/1/edit
  def edit
  end

  # POST /yearofstudies
  # POST /yearofstudies.json
  def create
    @yearofstudy = Yearofstudy.new(yearofstudy_params)

    respond_to do |format|
      if @yearofstudy.save
        format.html { redirect_to @yearofstudy, notice: 'Yearofstudy was successfully created.' }
        format.json { render :show, status: :created, location: @yearofstudy }
      else
        format.html { render :new }
        format.json { render json: @yearofstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yearofstudies/1
  # PATCH/PUT /yearofstudies/1.json
  def update
    respond_to do |format|
      if @yearofstudy.update(yearofstudy_params)
        format.html { redirect_to @yearofstudy, notice: 'Yearofstudy was successfully updated.' }
        format.json { render :show, status: :ok, location: @yearofstudy }
      else
        format.html { render :edit }
        format.json { render json: @yearofstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearofstudies/1
  # DELETE /yearofstudies/1.json
  def destroy
    @yearofstudy.destroy
    respond_to do |format|
      format.html { redirect_to yearofstudies_url, notice: 'Yearofstudy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yearofstudy
      @yearofstudy = Yearofstudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yearofstudy_params
      params.require(:yearofstudy).permit(:year)
    end
end
