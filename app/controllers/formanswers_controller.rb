class FormanswersController < ApplicationController
  before_action :set_formanswer, only: [:show, :edit, :update, :destroy]

  # GET /formanswers
  # GET /formanswers.json
  def index
    @formanswers = Formanswer.all
  end

  # GET /formanswers/1
  # GET /formanswers/1.json
  def show
  end

  # GET /formanswers/new
  def new
    @formanswer = Formanswer.new
  end

  # GET /formanswers/1/edit
  def edit
  end

  # POST /formanswers
  # POST /formanswers.json
  def create
    @formanswer = Formanswer.new(formanswer_params)

    respond_to do |format|
      if @formanswer.save
        format.html { redirect_to @formanswer, notice: 'Formanswer was successfully created.' }
        format.json { render :show, status: :created, location: @formanswer }
      else
        format.html { render :new }
        format.json { render json: @formanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formanswers/1
  # PATCH/PUT /formanswers/1.json
  def update
    respond_to do |format|
      if @formanswer.update(formanswer_params)
        format.html { redirect_to @formanswer, notice: 'Formanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @formanswer }
      else
        format.html { render :edit }
        format.json { render json: @formanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formanswers/1
  # DELETE /formanswers/1.json
  def destroy
    @formanswer.destroy
    respond_to do |format|
      format.html { redirect_to formanswers_url, notice: 'Formanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formanswer
      @formanswer = Formanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formanswer_params
      params.require(:formanswer).permit(:FormAnswer, :StudAnswerDateTime, :user_id, :form_id)
    end
end
