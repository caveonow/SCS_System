class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js


  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @user = User.all
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @user = User.all
    
    
   # @report = Report.new(report_params)

   # respond_to do |format|
   #   if @report.save
   #     format.html { redirect_to @report, notice: 'Report was successfully created.' }
   #     format.json { render :show, status: :created, location: @report }
   #   else
   #     format.html { render :new }
   #     format.json { render json: @report.errors, status: :unprocessable_entity }
   #   end
   # end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def horizonbar
    @user = User.joins(:faculty)
    @faculty = Faculty.all
    render json: @user.group(:gender).group(:facultyname).where(:faculty_id =>['2','3','4','5','6']).count.chart_json
    #render json: @user.group(:gender).group(:facultyname).where(:faculty_id =>['2','3','4','5','6']).count
    #render json: @user.group(:gender).count
  end
  
  def displayHorizonBar
     @user = User.all
     $Graphtype = "horizon"
  end
  
  def displayVerticalBar 
    @user = User.all 
    $Graphtype = "vertical"
  end
  
  def displayPie 
    @user = User.all
    $Graphtype = "pie"
  end
  
  def gettitle
    @titledata = params[:title]
    @subtitledata = params[:subtitle]
    @ytitledata = params[:ytitle]
    @xtitledata = params[:xtitle]
    $Graphtype
  end
  
  def seriesdata
    
    
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.fetch(:report, {})
    end
end
