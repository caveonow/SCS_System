class SubquestionanswersController < ApplicationController
  before_action :set_subquestionanswer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /subquestionanswers
  # GET /subquestionanswers.json
  def index
    @subquestionanswers = Subquestionanswer.all
  end

  # GET /subquestionanswers/1
  # GET /subquestionanswers/1.json
  def show
  end

  # GET /subquestionanswers/new
  def new
    @subquestionanswer = Subquestionanswer.new
  end

  # GET /subquestionanswers/1/edit
  def edit
  end

  # POST /subquestionanswers
  # POST /subquestionanswers.json
  def create
    @subquestionanswer = Subquestionanswer.new(subquestionanswer_params)

    respond_to do |format|
      if @subquestionanswer.save
        format.html { redirect_to @subquestionanswer, notice: 'Subquestionanswer was successfully created.' }
        format.json { render :show, status: :created, location: @subquestionanswer }
      else
        format.html { render :new }
        format.json { render json: @subquestionanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subquestionanswers/1
  # PATCH/PUT /subquestionanswers/1.json
  def update
    respond_to do |format|
      if @subquestionanswer.update(subquestionanswer_params)
        format.html { redirect_to @subquestionanswer, notice: 'Subquestionanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @subquestionanswer }
      else
        format.html { render :edit }
        format.json { render json: @subquestionanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subquestionanswers/1
  # DELETE /subquestionanswers/1.json
  def destroy
    @subquestionanswer.destroy
    respond_to do |format|
      format.html { redirect_to subquestionanswers_url, notice: 'Subquestionanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subquestionanswer
      @subquestionanswer = Subquestionanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subquestionanswer_params
      params.require(:subquestionanswer).permit(:SQAnswer, :SQAnswerCount, :subquestion_id)
    end
end
