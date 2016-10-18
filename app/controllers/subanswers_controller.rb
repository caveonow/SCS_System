class SubanswersController < ApplicationController
  before_action :set_subanswer, only: [:show, :edit, :update, :destroy]

  # GET /subanswers
  # GET /subanswers.json
  def index
    @subanswers = Subanswer.all
  end

  # GET /subanswers/1
  # GET /subanswers/1.json
  def show
  end

  # GET /subanswers/new
  def new
    @subanswer = Subanswer.new
  end

  # GET /subanswers/1/edit
  def edit
  end

  # POST /subanswers
  # POST /subanswers.json
  def create
    @subanswer = Subanswer.new(subanswer_params)

    respond_to do |format|
      if @subanswer.save
        format.html { redirect_to @subanswer, notice: 'Subanswer was successfully created.' }
        format.json { render :show, status: :created, location: @subanswer }
      else
        format.html { render :new }
        format.json { render json: @subanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subanswers/1
  # PATCH/PUT /subanswers/1.json
  def update
    respond_to do |format|
      if @subanswer.update(subanswer_params)
        format.html { redirect_to @subanswer, notice: 'Subanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @subanswer }
      else
        format.html { render :edit }
        format.json { render json: @subanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subanswers/1
  # DELETE /subanswers/1.json
  def destroy
    @subanswer.destroy
    respond_to do |format|
      format.html { redirect_to subanswers_url, notice: 'Subanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subanswer
      @subanswer = Subanswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subanswer_params
      params.require(:subanswer).permit(:SubAnswerDesc, :SubAnswerCount, :answer_id)
    end
end
