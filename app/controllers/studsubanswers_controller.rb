class StudsubanswersController < ApplicationController
  before_action :set_studsubanswer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /studsubanswers
  # GET /studsubanswers.json
  def index
    @studsubanswers = Studsubanswer.all
  end

  # GET /studsubanswers/1
  # GET /studsubanswers/1.json
  def show
  end

  # GET /studsubanswers/new
  def new
    @studsubanswer = Studsubanswer.new
  end

  # GET /studsubanswers/1/edit
  def edit
  end

  # POST /studsubanswers
  # POST /studsubanswers.json
  def create
    @studsubanswer = Studsubanswer.new(studsubanswer_params)

    respond_to do |format|
      if @studsubanswer.save
        format.html { redirect_to @studsubanswer, notice: 'Studsubanswer was successfully created.' }
        format.json { render :show, status: :created, location: @studsubanswer }
      else
        format.html { render :new }
        format.json { render json: @studsubanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studsubanswers/1
  # PATCH/PUT /studsubanswers/1.json
  def update
    respond_to do |format|
      if @studsubanswer.update(studsubanswer_params)
        format.html { redirect_to @studsubanswer, notice: 'Studsubanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @studsubanswer }
      else
        format.html { render :edit }
        format.json { render json: @studsubanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studsubanswers/1
  # DELETE /studsubanswers/1.json
  def destroy
    @studsubanswer.destroy
    respond_to do |format|
      format.html { redirect_to studsubanswers_url, notice: 'Studsubanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studsubanswer
      @studsubanswer = Studsubanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studsubanswer_params
      params.require(:studsubanswer).permit(:subanswer_id, :formanswer_id)
    end
end
