class BannerslidesController < ApplicationController
  before_action :set_bannerslide, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_filter :authenticate_user!
  # GET /bannerslides
  # GET /bannerslides.json
  def index
    @bannerslides = Bannerslide.all  
  end

  # GET /bannerslides/1
  # GET /bannerslides/1.json
  def show
  end

  # GET /bannerslides/new
  def new
    @bannerslide = Bannerslide.new
  end

  # GET /bannerslides/1/edit
  def edit
  end

  # POST /bannerslides
  # POST /bannerslides.json
  def create
    @bannerslide = Bannerslide.new(bannerslide_params)

    respond_to do |format|
      if @bannerslide.save
        format.html { redirect_to @bannerslide, notice: 'Bannerslide was successfully created.' }
        format.json { render :show, status: :created, location: @bannerslide }
      else
        format.html { render :new }
        format.json { render json: @bannerslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bannerslides/1
  # PATCH/PUT /bannerslides/1.json
  def update
    respond_to do |format|
      if @bannerslide.update(bannerslide_params)
        format.html { redirect_to @bannerslide, notice: 'Bannerslide was successfully updated.' }
        format.json { render :show, status: :ok, location: @bannerslide }
      else
        format.html { render :edit }
        format.json { render json: @bannerslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bannerslides/1
  # DELETE /bannerslides/1.json
  def destroy
    @bannerslide.destroy
    respond_to do |format|
      format.html { redirect_to bannerslides_url, notice: 'Bannerslide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def activebanner
    #if @bannerslide != params[:bannerslide_id]
    #params[:product][:category_ids] ||= []
    Bannerslide.all.each do |bannerslide|
      Bannerslide.update_all(:statusBs => "deactive")
      Bannerslide.where(id: params[:bannerslide_id]).update_all(:statusBs => "active")
  end
    redirect_to bannerslides_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bannerslide
      @bannerslide = Bannerslide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bannerslide_params
      params.require(:bannerslide).permit!
    end
end
