class StudanswersController < ApplicationController
  before_action :set_studanswer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /studanswers
  # GET /studanswers.json
  def index
    @studanswers = Studanswer.all
  end

  # GET /studanswers/1
  # GET /studanswers/1.json
  def show
  end

  # GET /studanswers/new
  def new
    @studanswer = Studanswer.new
  end

  # GET /studanswers/1/edit
  def edit
  end

  # POST /studanswers
  # POST /studanswers.json
  def create
    @studanswer = Studanswer.new(studanswer_params)

    respond_to do |format|
      if @studanswer.save
        format.html { redirect_to @studanswer, notice: 'Studanswer was successfully created.' }
        format.json { render :show, status: :created, location: @studanswer }
      else
        format.html { render :new }
        format.json { render json: @studanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studanswers/1
  # PATCH/PUT /studanswers/1.json
  def update
    respond_to do |format|
      if @studanswer.update(studanswer_params)
        format.html { redirect_to @studanswer, notice: 'Studanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @studanswer }
      else
        format.html { render :edit }
        format.json { render json: @studanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studanswers/1
  # DELETE /studanswers/1.json
  def destroy
    @studanswer.destroy
    respond_to do |format|
      format.html { redirect_to studanswers_url, notice: 'Studanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studanswer
      @studanswer = Studanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studanswer_params
      params.require(:studanswer).permit(:StudentAnswer, :StudentAnswer)
    end
end
