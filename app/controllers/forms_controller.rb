class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js



#---------------------------------- FORM ANSWERING ----------------------------------#
  def viewForm
    @forms = Form.all
      #this can remove later test retrieve first
    @sections = Section.all 
  end
  
  def startForm 
    @selectedSections = Section.where("form_id = ?", params[:formId])
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
          fa.FormStatus = "InProgress"
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
 
  #Display SubQuestion
  def displaySubQ   
    @subQ = Subquestion.where( "subquestions.answer_id = ?", params[:radio_answer_id])
    @qNum = Answer.select( " questions.QuestionNumber , answers.id, answers.question_id" )
                  .joins( :question)
                  .where(" answers.id = ?", params[:radio_answer_id]).first
    @formAnswer = Formanswer.where("id = ?", params[:formanswer_id]).first      
      
    respond_to do |format|
      format.js
    end 
  end
  
  def displaySubA
    @subA = Subanswer.where( "subanswers.answer_id = ?", params[:radio_answer_id])
    @qNum = Answer.select( " questions.QuestionNumber , answers.id, answers.question_id" )
              .joins( :question)
              .where(" answers.id = ?", params[:radio_answer_id]).first
    @formAnswer = Formanswer.where("id = ?", params[:formanswer_id]).first     
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
  
#      if StudAnswer.empty? (EMPTY)                  
#      Check answer given (if ANSWER == @getquestionAnswer.id)
#        Then ADD ANSWER
#      Check answer given (if ANSWER != @getquestionAnswer.id)
#        Do Nothing
#        
#    else !StudAnswer.empty? (NOT EMPTY)                 
#     Check answer given (if ANSWER == @getquestionAnswer.id)
#       Then Do Nothing
#     Check answer given (if ANSWER != @getquestionAnswer.id)
#       Then REMOVE ANSWER
  
  def saveAnsForSubs
    @getQuestionAnswers = Answer.where("question_id = ?", params[:q_id])
    @value = params[:answer_id]
    @getQuestionAnswers.each do |getQA|
      @getAnswer =  Studanswer.where("answer_id = ? AND formanswer_id = ?", getQA.id ,params[:formanswer_id])
      if @getAnswer.empty?
        puts "empty"
        puts @value
        puts getQA.id
        if @value.to_i == getQA.id
           #save answer
           puts "I ADDS"
           @answer = Studanswer.new do |a|
             a.answer_id = params[:answer_id]
             a.formanswer_id = params[:formanswer_id]
           end
           @answer.save
         end
      else !@getAnswer.empty?
        puts "not empty"
         #remove the answer
         if @value.to_i != getQA.id
           puts "I REMOVES"
            @getAnswer.first.destroy       
            if getQA.IsSubAnswer
              @getSubAnswer = Subanswer.where("answer_id = ?", getQA.id)
                @getSubAnswer.each do |subAns|
                  @remove =  Studsubanswer.where("subanswer_id = ? AND formanswer_id = ?",subAns.id,params[:formanswer_id])  
                  if !@remove.empty?
                    @remove.first.destroy
                  end
                end
                # answer.id > getsubquestion > get all subquestionanswers > remove from studsubquestionanswers
            elsif getQA.IsSubQuestion
              @getSubQuestion = Subquestion.where("answer_id = ?", getQA.id).first
                  @getSubQuestionAnswer = Subquestionanswer.where("subquestion_id = ? ", @getSubQuestion.id)
                    @getSubQuestionAnswer.each do |subQAns|      
                    @remove =  Studsubquestionanswer.where("subquestionanswer_id = ? AND formanswer_id = ?",subQAns.id,params[:formanswer_id])  
                    if !@remove.empty?
                      @remove.first.destroy
                    end
                  end
            end    
         end
      end
    end
    
     render :nothing => true
  end
  
  def saveSAns
     @getAnswer =  Studsubanswer.where("subanswer_id = ? AND formanswer_id = ?",params[:subAnswer_id],params[:formanswer_id])   
     if @getAnswer.empty?
          @answer = Studsubanswer.new do |a|
            a.subanswer_id = params[:subAnswer_id]
            a.formanswer_id = params[:formanswer_id]
          end
          @answer.save
     else 
       @getAnswer.first.destroy
     end   
    render :nothing => true
  end
  def saveSQAns
     @getAnswer =  Studsubquestionanswer.where("subquestionanswer_id = ? AND formanswer_id = ?",params[:subQAnswer_id],params[:formanswer_id])   
     if @getAnswer.empty?
          @answer = Studsubquestionanswer.new do |a|
            a.subquestionanswer_id = params[:subQAnswer_id]
            a.formanswer_id = params[:formanswer_id]
          end
          @answer.save
     else 
       @getAnswer.first.destroy
     end   
    render :nothing => true
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
    @form.id = current_user.id     #current_user.id 

    respond_to do |format|
      if @form.save
        @save = true;  
        @section = Section.new
        @counter =  "0"   
        puts "success"
      else
        @save = false;
        puts "fail"
      end
      format.html
      format.json
      format.js
    end
  end
  
  def submit_create_section
    @section = Section.new(section_params)
    @counter = Section.where("form_id = ?", @section.form_id).count
    respond_to do |format|
      if @section.save
        @save = true; 
        puts "success"
      else
        @save = false;
        puts "fail"
      end
      format.html
      format.json
      format.js
      
    end
  end
  
  def create_render_new_section
    @section = Section.new
    @form = Form.where("id = ?", params[:form_id]).first  
    @counter = Section.where("form_id = ?", params[:form_id]).count
    respond_to do |format|               
      format.js 
    end     
  end

  def create_question_display_section
    
    @formSections = Section.where("form_id = ?", params[:form_id])
    respond_to do |format|               
      format.js 
    end   
  end
    
    
  def create_question_display
    @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 

    respond_to do |format|
      format.js 
    end
  end
  
  def create_render_question
    
    @question = Question.new
    @section_id = params[:sec_id]
   
    @questCount = Question.where("section_id = ? ",  @section_id)
   
    respond_to do |format|
      format.js 
    end 
  end
   
    
    
    def create_render_answer
    @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
    @answer = Answer.new  
    @selectedQuestion = Question.where("id = ?", params[:question_id]).first
    @getAnswers = Answer.where("question_id = ?", params[:question_id]) 
     
    respond_to do |format|
      format.js 
    end
    end
    
    def create_question_remove
      @selectedQuestion = Question.where("id = ?", params[:question_id]).first
      
      @tempNumber = @selectedQuestion.QuestionNumber
      @getQuestionUnderSection = Question.order("questions.QuestionNumber").where("section_id = ?", params[:selected_section_id])     
      @getQuestionUnderSection.each do |question|
        if question.QuestionNumber > @selectedQuestion.QuestionNumber
          puts question.QuestionNumber
          puts "and"
          puts @selectedQuestion.QuestionNumber
          question.QuestionNumber = @tempNumber
          @updateQuestion = Question.find(question.id)
          @updateQuestion.update_attributes(:QuestionNumber => @tempNumber)
          @tempNumber += 1            
        end  
      end    
      
      @selectedQuestion.destroy     
      
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end
    end
    
    def create_answer_remove
      

      @answer = Answer.find(params[:ans_id]).destroy
      #---------------------------------------------------------------------------------
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end
    end
    
    def create_subanswer_remove
      

      @subAnswer = Subanswer.find(params[:subAns_id]).destroy
      
      #---------------------------------------------------------------------------------
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end      
    end
    
    def create_subquestion_remove
      
      @subQ = Subquestion.where("id = ?", params[:subQuest_id]).destroy_all
      
      #---------------------------------------------------------------------------------
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end      
    end
    
    def create_subquestionanswer_remove
      
      @subQAnswer = Subquestionanswer.find(params[:subQuestAns_id])
      @subQAnswer.delete      
      #---------------------------------------------------------------------------------
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end      
    end
    
    def create_edit_answer
      @selectedAnswer = Answer.find(params[:ans_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
     
      respond_to do |format|
        format.js
      end       
    end
    
    def create_edit_subanswer
      @selectedAnswer = Answer.find(params[:ans_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end                 
    end    
    
    
    def create_edit_subanswer_answer
      @selectedAnswer = Subanswer.find(params[:subAns_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end         
    end

    def create_edit_answer_subquestion
      @selectedAnswer = Answer.find(params[:ans_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      
      
      #######################################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
      
      @subQuestionCount = Subquestion.where("answer_id = ?", params[:ans_id]).count
      
      respond_to do |format|
        format.js
      end       
    end
        
    def create_edit_subquestion
      @selectedAnswer = Subquestion.find(params[:subQuest_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 

      
      respond_to do |format|
        format.js
      end     
    end
    
    def create_edit_subquestion_answer
      @selectedAnswer = Subquestionanswer.find(params[:subQuestAns_id])
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
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
    
    
    def question_params
      params.require(:question).permit(:QuestionDesc, :QuestionNumber, :section_id)
    end
    
    
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
