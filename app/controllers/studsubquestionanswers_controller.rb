class StudsubquestionanswersController < ApplicationController
  before_action :set_studsubquestionanswer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /studsubquestionanswers
  # GET /studsubquestionanswers.json
  def index
    @studsubquestionanswers = Studsubquestionanswer.all
  end

  # GET /studsubquestionanswers/1
  # GET /studsubquestionanswers/1.json
  def show
  end

  # GET /studsubquestionanswers/new
  def new
    @studsubquestionanswer = Studsubquestionanswer.new
  end

  # GET /studsubquestionanswers/1/edit
  def edit
  end

  # POST /studsubquestionanswers
  # POST /studsubquestionanswers.json
  def create
    @studsubquestionanswer = Studsubquestionanswer.new(studsubquestionanswer_params)

    respond_to do |format|
      if @studsubquestionanswer.save
        format.html { redirect_to @studsubquestionanswer, notice: 'Studsubquestionanswer was successfully created.' }
        format.json { render :show, status: :created, location: @studsubquestionanswer }
      else
        format.html { render :new }
        format.json { render json: @studsubquestionanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studsubquestionanswers/1
  # PATCH/PUT /studsubquestionanswers/1.json
  def update
    respond_to do |format|
      if @studsubquestionanswer.update(studsubquestionanswer_params)
        format.html { redirect_to @studsubquestionanswer, notice: 'Studsubquestionanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @studsubquestionanswer }
      else
        format.html { render :edit }
        format.json { render json: @studsubquestionanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studsubquestionanswers/1
  # DELETE /studsubquestionanswers/1.json
  def destroy
    @studsubquestionanswer.destroy
    respond_to do |format|
      format.html { redirect_to studsubquestionanswers_url, notice: 'Studsubquestionanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studsubquestionanswer
      @studsubquestionanswer = Studsubquestionanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studsubquestionanswer_params
      params.require(:studsubquestionanswer).permit(:subquestionanswer_id, :formanswer_id)
    end
end
