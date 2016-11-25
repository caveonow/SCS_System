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
    @formanswer = Formanswer.column_names
    @studAns = Studanswer.column_names
    
    @GraphTypes = Array.new
    
    @classArr = Array.new
    @classArr.push("form","section","question","answer")
    
    @choices = Array.new
    @choices.push("Answer")
    @GraphTypes.push("horizon1", "vertical1")
    
    
    @graphs = Array.new
    @graphs.push("horizon", "vertical")
    
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
    
    @user = User.joins(:yearofstudy, :levelofstudy, :faculty, :programme)
    @userform = User.joins(:yearofstudy, :levelofstudy, :faculty, :programme, :form)
    @usersection = User.joins(:yearofstudy, :levelofstudy, :faculty, :programme, :section)
    @userquestion = User.joins(:yearofstudy, :levelofstudy, :faculty, :programme, :question)
    @useranswer = User.joins(:yearofstudy, :levelofstudy, :faculty, :programme, :answer)
       
    @form = Form.all
    @formsection = Form.joins(:section)
    @formquestion = Form.joins(:question)
    @formanswer = Form.joins(:answer)  
    
    @section = Section.all
    @sectionquestion = Section.joins(:question)
    @sectionanswer = Section.joins(:answer)  
    
    @question = Question.all
    @questionanswer = Question.joins(:answer)  
    
    @answer = Answer.all     
    #render json: @quest.group("QuestionNumber").group("AnswerDesc").where("IsSubAnswer = 0 AND IsSubQuestion = 0").order("question_id").sum(:AnswerCount).chart_json

  #  render json: @quest.group("answers.id").where("answers.ParentID = 0  #{@test}").order("question_id").count.chart_json
   
  #  render json: @quest.group("QuestionNumber , QuestionDesc").group("answers.id , answers.AnswerDesc").where("answers.ParentID = 0").sum("AnswerCount").chart_json
  

  
  if params[:class] == "User"
    if params[:joinclass] == "None"
    @usedClass = @user
    elsif  params[:joinclass] == "Form"
    @usedClass = @userform
    
    elsif  params[:joinclass] == "Section"
    @usedClass = @usersection
      
    elsif  params[:joinclass] == "Question"
    @usedClass = @userquestion
      
    elsif  params[:joinclass] == "Answer"
    @usedClass = @useranswer
    end
  elsif params[:class] == "Form"
    if params[:joinclass] == "None"
    @usedClass = @form
    
    elsif  params[:joinclass] == "Section"
    @usedClass = @formsection
      
    elsif  params[:joinclass] == "Question"
    @usedClass = @formquestion
      
    elsif  params[:joinclass] == "Answer"
    @usedClass = @formanswer
    end    
  elsif params[:class] == "Section"
    if params[:joinclass] == "None"
    @usedClass = @section
    
    elsif  params[:joinclass] == "Question"
    @usedClass = @sectionquestion
      
    elsif  params[:joinclass] == "Answer"
    @usedClass = @sectionanswer
    end      
  elsif params[:class] == "Question"
    if params[:joinclass] == "None"
    @usedClass = @question

    elsif  params[:joinclass] == "Answer"
    @usedClass = @questionanswer
    end    
  elsif params[:class] == "Answer"
    if params[:joinclass] == "None"
    @usedClass = @answer         
    end
  end
    @constrainsIsThere = true
    @totalGroup = 2
    @fgroup = params[:firstGroup]    
    if @fgroup.blank?
      @totalGroup -= 1
      @fgroup = params[:secondGroup]
     @firstGroup = @fgroup.join(",")
    else
     @firstGroup = @fgroup.join(",")   
    end
    @sgroup = params[:secondGroup]
    if @sgroup.blank?
      @totalGroup -= 1
    else      
    @secondGroup = @sgroup.join(",")
    end    
    if params[:constrains].blank?
      @constrainsIsThere = false
    else
      @contrains = params[:constrains]
    end
    
  if @totalGroup == 1
    if @constrainsIsThere
      render json: @usedClass.group(@firstGroup).where(@contrains).sum("AnswerCount").chart_json
    else
      render json: @usedClass.group(@firstGroup).count.chart_json
      
    end
  else
    if @constrainsIsThere
      render json: @usedClass.group(@firstGroup).group(@secondGroup).where(@constrains).sum("AnswerCount").chart_json
    else
      render json: @usedClass.group(@firstGroup).group(@secondGroup).count.chart_json  
    end
  end


  end
  
  def testing2
    
    @formTry = Form.joins(:answer)
    @section = Section.joins(:answer)
    @formans = Studanswer.joins(:answer)
    @answer = Answer.all
    @questions = Question.joins(:answer)
    @user = User.joins(:answer)
    @user2 = User.joins(:faculty)
    @test2 = User.all
     
    @quest = Question.joins(:answer)

    @test = ""
    #render json: @quest.group("QuestionNumber").group("AnswerDesc").where("IsSubAnswer = 0 AND IsSubQuestion = 0").order("question_id").sum(:AnswerCount).chart_json

  #  render json: @quest.group("answers.id").where("answers.ParentID = 0  #{@test}").order("question_id").count.chart_json
   # render json: @user2.group("gender").group("facultyname").count
    render json: @quest.group(" answers.AnswerDesc").group(" QuestionDesc").where("answers.ParentID = 0").sum("AnswerCount").chart_json
   # render json: @user2.group("name").count.chart_json
  
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
    @formans = Studanswer.joins(:answer)
    @answer = Answer.all
    @user = User.all
    @Graphtype = params[:GraphType]
    
    @aStringTest = params[:class]

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
    
    @chartWidth = params[:chartWidth]
    @chartHeight = params[:chartHeight]
    @chartbackground = params[:chartbackground]
    @bordercolor = params[:bordercolor]
    @borderradius = params[:borderradius]
    @borderwidth = params[:borderwidth]
    @plotimage = params[:plotimage]
    @plotbordercolor = params[:plotbordercolor]
    @plotborderwidth = params[:plotborderwidth]
    @valueprefix = params[:valueprefix]
    @valuesuffix = params[:valuesuffix]

    @Graphtype
  end
  
  def seriesdata
    
    
  end
  
  def getdata
    
    @titledata = params[:title]
    @subtitledata = params[:subtitle]
    @ytitledata = params[:ytitle]
    @xtitledata = params[:xtitle]
    @chartWidth = params[:chartWidth]
    @chartHeight = params[:chartHeight]
    
    @chartbackground = params[:chartbackground]
    @bordercolor = params[:bordercolor]
    @borderradius = params[:borderradius]
    @borderwidth = params[:borderwidth]
    @plotimage = params[:plotimage]
    @plotbordercolor = params[:plotbordercolor]
    @plotborderwidth = params[:plotborderwidth]
    @valueprefix = params[:valueprefix]
    @valuesuffix = params[:valuesuffix]

    
    
    
    if params[:optiontable] == "1"
      @className = "User"
    elsif params[:optiontable] == "2"
      @className = "Form"
    elsif params[:optiontable] == "3"
      @className = "Section"
    elsif params[:optiontable] == "4"
      @className = "Question"
    elsif params[:optiontable] == "5"
      @className = "Answer"
    end
     
    @strGroup1 = params[:Group1]
    @strGroup2 = params[:Group2]
    ##################################################################################### 3
    
    @strTest = ""
    @group3 = Array.new
    @group3.push("answers.ParentID = 0", "IsSubAnswer = 1", "questions.IsSubQuestion = 1")
    puts @index
    puts "^6^ indeX"
    @counter = 1
    if params[:constrain].blank?
     
    else
      @index = params[:constrain]
      @index.each do |test|
      @strTest << @group3[test.to_i]
      
      if @counter < @index.size
        @strTest << " AND "
      end
      @counter += 1  
    end
    end
    
    
    puts @strTest
    #####################################################################################3

    @Graphtype = params[:GraphType]
    
    @joinName = params[:joinsTable]
    
    respond_to do |format|
      format.js
    end
  end
  
  def get_joins
    
    @joinsValue = Array.new
    @proceed = true
    @specialcase = false
    @group1 = Array.new
    
    if params[:optiontable] == "0"
      @proceed = false
    
    elsif params[:optiontable] == "1"
      @joinsValue.push("None","Form","Section","Question","Answer")
      @group1.push("name","gender", "facultyname", "programmename","year","levelname","age")  
 
    elsif params[:optiontable] == "2"
      @joinsValue.push("None","Section","Question","Answer")
      @group1.push("forms.id", "FormName")
      
    elsif params[:optiontable] == "3"
      @joinsValue.push("None","Question","Answer")
      @group1.push("sections.id", "SectionName")
      
    elsif params[:optiontable] == "4"
      @joinsValue.push("None","Answer")
      @group1.push("questions.id" ,"QuestionDesc", "QuestionNumber") 
      
    elsif params[:optiontable] == "5"  
      @joinsValue.push("None")
      @group1.push("answers.id" , "AnswerDesc")
      @specialcase = true
    end
      
    respond_to do |format|
      format.js
    end
  end

  def get_other_data
    
    @group2 = Array.new
    @group2.push("Select Only Answers","Select Only SubAnswers","Select Only Sub Question Answers")
    @group1 = Array.new
    @answerConstrain = false
    ##user
    if params[:className] == "1"
      if params[:joinsTable] == "None"
        @group1.push("name","gender", "facultyname", "programmename","year","levelname","age")      
      elsif params[:joinsTable] == "Form"
        @group1.push("name","gender", "facultyname", "programmename","year","levelname","age", "forms.id", "FormName")   
      elsif params[:joinsTable] == "Section"
        @group1.push("name","gender",  "facultyname", "programmename","year","levelname","age", "forms.id", "FormName", "sections.id", "SectionName")    
      elsif params[:joinsTable] == "Question"
        @group1.push("name","gender",  "facultyname", "programmename","year","levelname","age", "forms.id", "FormName", "sections.id", "SectionName", "questions.id" , "QuestionDesc", "QuestionNumber")        
      elsif params[:joinsTable] == "Answer"
        @group1.push("name","gender",  "facultyname", "programmename","year","levelname","age", "forms.id", "FormName", "sections.id", "SectionName", "questions.id" , "QuestionDesc", "QuestionNumber", "answers.id", "AnswerDesc")
        @answerConstrain = true             
      end
    ##form
    elsif params[:className] == "2"
      if params[:joinsTable] == "None"
        @group1.push("forms.id", "FormName")      
      elsif params[:joinsTable] == "Section"
        @group1.push("forms.id", "FormName", "sections.id", "SectionName")    
      elsif params[:joinsTable] == "Question"
        @group1.push("forms.id", "FormName", "sections.id", "SectionName", "questions.id" , "QuestionDesc", "QuestionNumber")        
      elsif params[:joinsTable] == "Answer"
        @group1.push("forms.id", "FormName", "sections.id", "SectionName", "questions.id" , "QuestionDesc", "QuestionNumber", "answers.id", "AnswerDesc") 
         @answerConstrain = true            
      end
    ##section
    elsif params[:className] == "3"
      if params[:joinsTable] == "None"
        @group1.push("sections.id", "SectionName")      
      elsif params[:joinsTable] == "Question"
        @group1.push("sections.id", "SectionName",  "questions.id" ,"QuestionDesc", "QuestionNumber")        
      elsif params[:joinsTable] == "Answer"
        @group1.push("sections.id", "SectionName",  "questions.id" ,"QuestionDesc", "QuestionNumber", "answers.id", "AnswerDesc")   
        @answerConstrain = true         
      end      
    ##question
    elsif params[:className] == "4"
      if params[:joinsTable] == "None"
        @group1.push("questions.id" ,"QuestionDesc", "QuestionNumber")         
      elsif params[:joinsTable] == "Answer"
        @group1.push("questions.id" ,"QuestionDesc", "QuestionNumber", "answers.id", "AnswerDesc")        
         @answerConstrain = true     
      end            
    ##answer
    elsif params[:className] == "5"
      if params[:joinsTable] == "None"
        @group1.push("answers.id" , "AnswerDesc")    
         @answerConstrain = true     
      end              
    end
    respond_to do |format|
      format.js
    end    
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
