class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  helper_method :obtain_questions , :obtain_answers, :obtain_subanswers, :obtain_subquestion , :obtain_subquestionanswer, :check_answered, :trySomething


#---------------------------------- FORM ANSWERING ----------------------------------#
  def viewForm
    @forms = Form.all
      #this can remove later test retrieve first
    @sections = Section.all 
  end
  
  def startForm 
    @selectedSections = Section.where("form_id = ?", params[:formId])
  end
  
    def check_answered(fa_id, ans_id)
      Studanswer.where("answer_id = ? AND formanswer_id = ?", ans_id, fa_id)
    end
  
    def obtain_questions(section_id)
      Question.where( "questions.section_id= ?" , section_id)
    end
    
    def obtain_answers(question_id)
      Answer.where( "answers.question_id = ?", question_id)
    end
    
    def obtain_subanswers(answer_id)
      Subanswer.where( "subanswers.answer_id = ?", answer_id)
    end
    
    def obtain_subquestion(answer_id)
      Subquestion.where( "subquestions.answer_id = ?", answer_id)
    end  
    
    def obtain_subquestionanswer(subquestionanswers_id)
      Subquestionanswer.where(" subquestionanswers.subquestion_id = ?", subquestionanswers_id)
    end
 
 #viewselected Form
  def selectForm
    
    @sections = Section.where("form_id = ?", params[:form_id])
    @formName = Form
    .select("forms.FormName, forms.id")
    .where("id = ?", params[:form_id]).first
    
    @formAnswer =  Formanswer.where("user_id = ? AND form_id = ?",params[:user_id],params[:form_id])
      
      if @formAnswer.empty?
        @test = Formanswer.new do |fa|
          fa.FormAnswer = "WAT"
          fa.StudAnswerDateTime = Time.now
          fa.user_id = params[:user_id]
          fa.form_id = params[:form_id]
        end
        @test.save
      end
      
    
  end
 
 #Display Question
  def displayQ
    @sectionTest = Section.where("form_id = ?", params[:form_id])
    @selected_section = Section.where("id = ?", params[:section_id]).first
    
    @getStudAnswer = Studanswer.where("formanswer_id = ?", params[:formanswer_id])
    
      obtain_question
      obtain_all_questions
      
      respond_to do |format|
      format.js
    end  
  end
  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ this one need to add something new @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  #Display SubQuestion
  def displaySubQ   
    @subQ = Subquestion.where( "subquestions.answer_id = ?", params[:radio_answer_id])
    @qNum = Answer.select( " questions.QuestionNumber , answers.id" )
                  .joins( :question)
                  .where(" answers.id = ?", params[:radio_answer_id]).first
    @formAnswer = Formanswer.where("id = ?", params[:formanswer_id]).first              
    respond_to do |format|
      format.js
    end  
    
  end
  
  def displaySubA
        
    @subA = Subanswer.where( "subanswers.answer_id = ?", params[:radio_answer_id])

      respond_to do |format|
      format.js
    end  
  end

  def saveAns
    
       @getAnswer =  Studanswer.where("answer_id = ? AND formanswer_id = ?",params[:answer_id],params[:formanswer_id])   
         if @getAnswer.empty?
              @answer = Studanswer.new do |a|
                a.answer_id = params[:answer_id]
                a.formanswer_id = params[:formanswer_id]
              end
              @answer.save
         else 
           @getAnswer.first.destroy
         end
 
   
    render :nothing => true
  end
  
  
  
  def saveSAns
    
  end
  def saveSQAns
    
  end
  #---------------------------------- FORM ANSWERING ----------------------------------#
  
  #---------------------------------- FORM CREATION ----------------------------------#
  
 
  
  def create_survey
    @form = Form.new
  end
  
  def submit_create_survey
    @form = Form.new(form_params)
    @form.FormDateTime = Time.now
    @form.FormStatus = 'Available'
    @form.user_id = current_user.id #change later
    
    respond_to do |format|
      if @form.save
        @save = true;  
        @section = Section.new
        format.html
        format.json
        format.js
        puts "success"
      else
        @save = false;
        puts "fail"
        format.html
        format.json
        format.js
      end
    end
  end
  def submit_create_section
    @section = Section.new(section_params)    
    respond_to do |format|
      if @section.save
        @save = true;  
        format.html
        format.json
        format.js
        puts "success"
      else
        @save = false;
        puts "fail"
        format.html
        format.json
        format.js
      end
    end
  end
  #---------------------------------- FORM CREATION ----------------------------------#
  
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)
    @form.FormDateTime = Time.now
    @form.FormStatus = 'Available'
    @form.user_id = current_user.id #change later
    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
#---------------------------------- FORM ANSWERING ----------------------------------#
 def create_studanswer
   @studanswer = Studanswer.new(studanswer_params)
 end
 def create_studsubanswer
   @studsubanswer = Studsubanswer.new(studsubanswer_params)
   
 end
 def create_studsubquestionanswer
   @studsubquestionanswer = Studsubquestionanswer.new(studsubquestionanswer_params)
   
 end
#---------------------------------- FORM ANSWERING ----------------------------------#



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:FormName, :FormDescription)
    end
    
    def section_params
      params.require(:section).permit(:SectionName, :SectionDescription, :form_id)
    end
    #---------------------------------- FORM ANSWERING ----------------------------------#
    def formanswer_params
      params.require(:formanswer).permit(:FormAnswer, :StudAnswerDateTime, :form_id)
    end
    
    def studanswer_params
      params.require(:studanswer).permit(:answer_id, :formanswer_id)
    end
    
    def studsubanswer_params
      params.require(:studsubanswer).permit(:subanswer_id, :formanswer_id)
      
    end
    
    def studsubquestionanswer_params
      params.require(:studsubquestionanswer).permit(:subquestionanswer_id, :formanswer_id)
      
    end
    
    def obtain_question
      if params[:question_id] == "0"
        obtain_first_question
      else
        @question = Question.where("id = ?", params[:question_id]).first  
      end
    end
    def obtain_first_question
      @question = Question
      .order("questions.QuestionNumber")
      .where("questions.section_id = ? AND questions.QuestionNumber = ?", params[:section_id], 1).first  
    end
    def obtain_all_questions
      @allQuestions = Question
      .order("questions.QuestionNumber")
      .where("questions.section_id = ?", params[:section_id])
    end
    #---------------------------------- FORM ANSWERING ----------------------------------#
    
end
