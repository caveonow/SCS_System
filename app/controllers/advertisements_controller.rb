class AdvertisementsController < ApplicationController
  before_filter :authenticate_user!
  #before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertisements = Advertisement.all
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
    @advertisement = Advertisement.find(params[:id])
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  # GET /advertisements/1/edit
  def edit
    authorize! :edit, @advertisement
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    #@advertisement.user_id = current_user.id
    @advertisement = Advertisement.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   def activeadvertisement
     #@advertisement = Advertisement.all
     Advertisement.all.each do |advertisement|
        Advertisement.update_all(:statusAd => "deactive") 
        Advertisement.where(id: params[:advertisement_id]).update_all(:statusAd => "active")    
    end
      redirect_to advertisements_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.require(:advertisement).permit!
    end
end
