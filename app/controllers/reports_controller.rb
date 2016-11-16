class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  before_filter :authenticate_user!
  load_and_authorize_resource

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
    
    @form = Form.column_names
    @section = Section.column_names
    @question = Question.column_names
    @answer = Answer.column_names
    @subAnswer = Subanswer.column_names
    @subQuestion = Subquestion.column_names
    @subQuestionAnswer = Subquestionanswer.column_names
    @formanswer = Formanswer.column_names
    @studAns = Studanswer.column_names
    @studSubAns = Studsubanswer.column_names
    @studSubQuestAns = Studsubquestionanswer.column_names
    
    @GraphTypes = Array.new
    
    @classArr = Array.new
    
    @classArr.push("form","section","question","answer","subanswer","subquestion","subquestionanswer")
    @GraphTypes.push("horizon", "vertical", "pie")
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
    #@user = User.joins(:faculty)
    #@faculty = Faculty.all
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    puts "WTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFf"
    #render json: @user.group(:gender).group(:facultyname).count.chart_json
    puts params[:class]
    
    if params[:class] == "form"
      @class = Form.all
    end
    render json: @class.group(:FormName).group(:FormDescription).count.chart_json
    #render json: @user.group(:gender).count.chart_json

  end
  
  def testing2
    
    @formTry = Form.joins(:answer)
    @section = Section.joins(:answer)
    @sectiontosubans = Section.joins(:subanswer)
    @sectiontosuquestionanswer = Section.joins(:subquestionanswer)
    @formans = Studanswer.joins(:answer)
    @formsans = Studsubanswer.joins(:subanswer)
    @formsqans = Studsubquestionanswer.joins(:subquestionanswer)
    @answer = Answer.all
    @questions = Question.joins(:answer)
    @subanswer = Subanswer.all
    @subqanswer = Subquestionanswer.all
    @user = User.joins(:answer)

    @value1 = "formName"
    @value2 = "QuestionDesc"
   # render json: @user.group(:name).group(:AnswerDesc).sum(:AnswerCount).chart_json
    render json: @questions.group("AnswerDesc").group("QuestionDesc").where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum("AnswerCount").chart_json
    
    #render json: @formTry.group(@value1).group(@value2).group("AnswerDesc").where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum("AnswerCount").chart_json
   
   
    #render json: @answer.group(:AnswerDesc).where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum(:AnswerCount).chart_json
    
  end
  
  def testing_post
    @Graphtype = params[:GraphType]
    
    #@form_id = params[:form_id]
    #@section_id = params[:section_id]
    #@question_id = params[:question_id]
    @formColumn = params[:form_column]
    @section_id = "section"
    @question_id ="question"
    
    @class = params[:class]

  end

    def testing
    @formTry = Form.joins(:answer)
    @section = Section.joins(:answer)
    @sectiontosubans = Section.joins(:subanswer)
    @sectiontosuquestionanswer = Section.joins(:subquestionanswer)
    @formans = Studanswer.joins(:answer)
    @formsans = Studsubanswer.joins(:subanswer)
    @formsqans = Studsubquestionanswer.joins(:subquestionanswer)
    @answer = Answer.all
    @subanswer = Subanswer.all
    @subqanswer = Subquestionanswer.all
    @user = User.all
    @Graphtype = "horizon1"
    
   # render json: @section.group(:SectionName).group(:QuestionDesc).group(:AnswerDesc).where("IsSubAnswer = 0 AND IsSubQuestion = 0 AND form_id = 1").sum(:AnswerCount).chart_json
    #answer which is answered by people
   # render json: @formans.group(:AnswerDesc).where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum(:AnswerCount).chart_json
   #normal answer answered by people
   #render json: @answer.group(:AnswerDesc).where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum(:AnswerCount).chart_json
    
    
  #  render json: @subanswer.group(:SADesc).sum(:SACount).chart_json
   # render json: @subqanswer.group(:SQAnswer).sum(:SQAnswerCount).chart_json
    
  #  render json: @sectiontosuquestionanswer.group(:SectionName).group(:QuestionDesc).group(:AnswerDesc).where("IsSubAnswer = 0 AND form_id = 2").sum(:AnswerCount).chart_json
  
      #shows all thos
    #render json: @formTry.group(:formName).group(:QuestionDesc).group(:AnswerDesc).where("IsSubAnswer = 0 AND IsSubQuestion = 0").sum(:AnswerCount).chart_json

    end

  def displayHorizonBar
     @user = User.all
     @Graphtype = "horizon"
  end
  
  def displayVerticalBar 
    @user = User.all 
    @Graphtype = "vertical"
  end
  
  def displayPie 
    @user = User.all
    @Graphtype = "pie"
  end
  
  def gettitle
    @titledata = params[:title]
    @subtitledata = params[:subtitle]
    @ytitledata = params[:ytitle]
    @xtitledata = params[:xtitle]
    @Graphtype
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
