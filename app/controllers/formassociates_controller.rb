class FormassociatesController < ApplicationController
  before_action :set_formassociate, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /formassociates
  # GET /formassociates.json
  def index
    @formassociates = Formassociate.all
  end

  # GET /formassociates/1
  # GET /formassociates/1.json
  def show
  end

  # GET /formassociates/new
  def new
    @formassociate = Formassociate.new
  end

  # GET /formassociates/1/edit
  def edit
  end

  # POST /formassociates
  # POST /formassociates.json
  def create
    @formassociate = Formassociate.new(formassociate_params)

    respond_to do |format|
      if @formassociate.save
        format.html { redirect_to @formassociate, notice: 'Formassociate was successfully created.' }
        format.json { render :show, status: :created, location: @formassociate }
      else
        format.html { render :new }
        format.json { render json: @formassociate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formassociates/1
  # PATCH/PUT /formassociates/1.json
  def update
    respond_to do |format|
      if @formassociate.update(formassociate_params)
        format.html { redirect_to @formassociate, notice: 'Formassociate was successfully updated.' }
        format.json { render :show, status: :ok, location: @formassociate }
      else
        format.html { render :edit }
        format.json { render json: @formassociate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formassociates/1
  # DELETE /formassociates/1.json
  def destroy
    @formassociate.destroy
    respond_to do |format|
      format.html { redirect_to formassociates_url, notice: 'Formassociate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formassociate
      @formassociate = Formassociate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formassociate_params
      params.require(:formassociate).permit(:form_id, :yearofstudy_id, :levelofstudy_id, :faculty_id, :programme_id, :agefrom, :ageto, :agecondition)
    end
end
