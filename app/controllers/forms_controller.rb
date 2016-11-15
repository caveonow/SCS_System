class FormsController < ApplicationController
    before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js



#------------------------------------------------------------------------------------#
#---------------------------------- FORM ANSWERING ----------------------------------#
#------------------------------------------------------------------------------------#

  #-------------------------------------------------------------------------------#
  #---------------------------------- ADMIN SIDE----------------------------------#
  #-------------------------------------------------------------------------------#
  
  def admin_view_survey
    @sortedForm = Form.order("forms.FormDateTime DESC").where.not("forms.FormStatus = ?", "Removed")
    @formsRemoved = false
    @statusArr = Array.new
    @statusArr.push("Published", "Not Published", "Completed")
  end
  
  def admin_sort 
    @sortedForm = Form.all.order("CASE forms.FormStatus WHEN '#{params[:status]}' THEN 1 ELSE 9 END ASC, id ASC").where.not("forms.FormStatus = ?", "Removed")
    @formsRemoved = false
    respond_to do |format|
      format.js
    end
  end
  
  def admin_display_removed
    @sortedForm = Form.order("forms.FormDateTime DESC").where("forms.FormStatus = ?", "Removed")
    @formsRemoved = true
    respond_to do |format|
      format.js { render :action => "admin_sort" }
    end    
  end
  
  def admin_information
     respond_to do |format|
      format.js 
    end       
  end

  def admin_select_survey 
    @selectedSections = Section.where("form_id = ?", params[:form_id])
  end
  
  
  def admin_edit_survey
    @form = Form.find(params[:form_id]) 
    @getSection = Section.where("form_id = ?", params[:form_id])    
    @statusArr = Array.new
    @statusArr.push("Published", "Not Published", "Completed", "Removed")
    @formAssociates = Formassociate.where("form_id = ?", params[:form_id])
  end
  
    def submit_edit_survey
      @form = Form.find(params[:form_id])
      @proceed = true
      @save = false;
      if params[:form][:FormName] == ""
        @proceed = false
      end
      if params[:form][:FormStatus] == ""
        @proceed = false
      end
      puts params[:form][:FormDescription] 
      
      if params[:form][:FormDescription] == ""
        puts " FUCK U DOG"
        @proceed = false
      end
  
      respond_to do |format|
        if @proceed
          @form.update_attributes(:FormDescription => params[:form][:FormDescription], :FormStatus => params[:form][:FormStatus], :FormName => params[:form][:FormName])
          @save = true;  
        else
          @save = false;
        end
        
        puts @save
        format.js
      end
    end
    
    def admin_create_associates
      @ageConditionArr = Array.new
      @ageConditionArr.push("All","Equal", "Less Than", "More Than","Between") 
      @formassociate = Formassociate.new
      @form_id = params[:form_id]
      respond_to do |format|
        format.js
      end      
    end
    
    def admin_agecondition_change
      respond_to do |format|
        format.js
      end 
    end
    
    
    def submit_edit_associates
      
    #  formassociate_params

      @formassociate = Formassociate.new(formassociate_params)
      @form = Form.find(params[:form_id])
      @formassociate.form_id = @form.id
      @ageto_exist = false
      @ageValidity = true
      
         if !params[:ageto].nil?
           @ageto_exist = true
           @formassociate.ageto = params[:ageto]
           
           if params[:formassociate][:agefrom].to_i >= params[:ageto].to_i
             @ageValidity = false
           end 
          
         else
           @formassociate.ageto = nil
         end
      
      respond_to do |format|
        if @ageto_exist #got ageTo
          if !params[:ageto] == "" || @ageValidity #check if ageto is not blank
            if @formassociate.save #not blank = save try
              @save = true        #save success
            else
              @save = false       #save fail
            end
          else
            @save = false
          end
        else    #ageTo dont have
          puts "ageto x ada"
          if @formassociate.save #not blank = save try
            @save = true        #save success
          else
            @save = false       #save fail
          end
        end
        @formAssociates = Formassociate.where("form_id = ?", params[:form_id])
        format.js
      end
    end
    
    def admin_delete_associate
      @formassociate = Formassociate.find(params[:asso_id])
      @formassociate.delete
    
      respond_to do |format|
        format.html { redirect_to admin_edit_survey_forms_path(:form_id => params[:id]) }
      end
    end
    
    def admin_edit_survey_question
       @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
       
       respond_to do |format|
         format.js 
       end
    end
  
  def admin_delete_survey
    
    @getForm = Form.find(params[:form_id]) 
    @getForm.update_attributes(:FormStatus => "Removed")
    
    @sortedForm = Form.order("forms.FormDateTime DESC").where("forms.FormStatus = ?", "Removed")
    @formsRemoved = true
    
    respond_to do |format|
      format.js { render :action => 'admin_sort'}
    end   
    
  end
  
  def admin_edit_new_section
    @form = Form.find(params[:form_id])
    @section = Section.new    
    respond_to do |format|
      format.js
    end
  end
  
    def admin_create_section
      @section = Section.new(section_params)
      @getSection = Section.where("form_id = ?", params[:section][:form_id])
      respond_to do |format|
        if @section.save
          @save = true; 
        else
          @save = false;
        end
        format.js  
      end
    end
    
    def admin_edit_remove_section
      @getSection = Section.where("form_id = ?", params[:form_id])
      respond_to do |format|
        format.js
      end
    end
    
    def admin_edit_remove_section_confirm
      @removeSection = Section.find(params[:section_id])
      @getSection = Section.where("form_id = ?", @removeSection.form_id)
      @removeSection.delete
      respond_to do |format|
        format.js
      end
    end
  #-------------------------------------------------------------------------------#
  #---------------------------------- ADMIN SIDE----------------------------------#
  #-------------------------------------------------------------------------------#
    
    
  #-------------------------------------------------------------------------------#
  #---------------------------------- USER SIDE-----------------------------------#
  #-------------------------------------------------------------------------------#
#user main page
  def user_view_surveys
    @forms = Form.all
    @formsInProgress = Formanswer.where("user_id = ? AND FormStatus = ?", current_user.id, "InProgress")
    @formsCompleted = Formanswer.where("user_id = ? AND FormStatus = ?", current_user.id, "Completed")
    @formsIncomplete = Formanswer.where("user_id = ? AND FormStatus = ?", current_user.id, "Incomplete")
    @valueComplete = true
    @valueinProgress = true
    @addIfTrue = false
    
    @f_choice = false
    @l_choice = false
    @y_choice = false
    @p_choice = false
    
    @user_available_survey = Array.new
    @user_form_inProgress = Array.new
    @user_form_completed = Array.new  
    @availableSurveys = Form.where("FormStatus = ?", "Not Published")
    
    
    @availableSurveys.each do |form|
    #obtain  forms in progress
       @formsInProgress.each do |inprogress|
         if form.id == inprogress.form_id
           @user_form_inProgress.push(form)
         @valueinProgress = false;
         break           
         end  
       end
       @formsCompleted.each do |complete|
       if form.id == complete.form_id
         @user_form_completed.push(form)
         @valueComplete = false;
         break          
        end
      end
      
       if @valueinProgress == false ||  @valueComplete == false
         break
       else
         @ageValidation = ageCheck(current_user.id,form.id)
         
        if @ageValidation == true
          @addIfTrue = true
          @formConstraints = Formassociate.where("form_id = ?", form.id).first
            if @formConstraints.faculty.facultyname == "All"##         
              @addIfTrue = true
              #FACULTY IS ALL
            elsif @formConstraints.faculty_id != current_user.faculty_id## 
              @addIfTrue = false      
              break
              #FACULTY IS SPECIFIC
            end##
            
            if @formConstraints.levelofstudy.levelname == "All"###     
              @addIfTrue = true
             #LEVEL IS ALL
             
            elsif @formConstraints.levelofstudy_id != current_user.levelofstudy_id###
              @addIfTrue = false      
              break 
              #LEVEL IS SPECIFIC            
            end###
          
            if @formConstraints.yearofstudy.year == "All"####
              @addIfTrue = true
              #return true #YEAR IS ALL
              
            elsif @formConstraints.yearofstudy_id !=  current_user.yearofstudy_id####
              @addIfTrue = false      
              break
              #YEAR IS SPECIFIC                    
            end####
                 
            if @formConstraints.programme.programmename == "All"#####    
              @addIfTrue = true              
              #return true #PROGRAMME IS ALL
              
            elsif @formConstraints.programme_id != current_user.programme_id#####
              @addIfTrue = false      
              break
              #PROGRAMME IS SPECIFIC               
            end#####    
        else
          @addIfTrue = false
        end
        
        if @addIfTrue
            @user_available_survey.push(form)
            puts @user_available_survey.first
        end
       end
       
     end
         
     
    @formsAnsweredStatus = Array.new
    @formsAnsweredStatus.push("Inprogress","Completed", "Incomplete")
    
  end
  

 #viewselected Form
  def user_selected_survey
    @sections = Section.where("form_id = ?", params[:form_id])
    @formName = Form
    .select("forms.FormName, forms.id")
    .where("id = ?", params[:form_id]).first 
    @formAnswer =  Formanswer.where("user_id = ? AND form_id = ?",current_user.id,params[:form_id])    
      if @formAnswer.empty?
        @formCreate = Formanswer.new do |fa|
          fa.FormStatus = "InProgress"
          fa.StudAnswerDateTime = Time.now
          fa.user_id = current_user.id
          fa.form_id = params[:form_id]
        end
        @formCreate.save
      end
  end
 

 #Display Question
  def user_selected_survey_display_question
    @formSections = Section.where("form_id = ?", params[:form_id])
    @selected_section = Section.where("id = ?", params[:section_id]).first   
    @getStudAnswer = Studanswer.where("formanswer_id = ?", params[:formanswer_id])
    @translators = Translator.all

    update_form_settings( @formSections ,params[:formanswer_id])

    
      obtain_question      # @questions
      obtain_all_questions(params[:section_id]) # @allQuestions
      @answer_count = get_current_count_status(params[:section_id], params[:formanswer_id])
      respond_to do |format|
      format.js
    end  
  end
 
  #Display SubQuestion
  def user_selected_survey_display_subQuestion   
    @subQ = Subquestion.where( "subquestions.answer_id = ?", params[:radio_answer_id])
    @qNum = Answer.select( " questions.QuestionNumber , answers.id, answers.question_id" )
                  .joins( :question)
                  .where(" answers.id = ?", params[:radio_answer_id]).first
    @formAnswer = Formanswer.where("id = ?", params[:formanswer_id]).first 
    @translators = Translator.all     
      
    respond_to do |format|
      format.js
    end 
  end
  
  def user_selected_survey_display_subAnswer
    @subA = Subanswer.where( "subanswers.answer_id = ?", params[:radio_answer_id])
    @qNum = Answer.select( " questions.QuestionNumber , answers.id, answers.question_id" )
              .joins( :question)
              .where(" answers.id = ?", params[:radio_answer_id]).first
    @formAnswer = Formanswer.where("id = ?", params[:formanswer_id]).first 
    @translators = Translator.all    
      respond_to do |format|
      format.js
    end  
  end

  def save_ans 
    #@questionCheck = false
       @getAnswer =  Studanswer.where("answer_id = ? AND formanswer_id = ?",params[:answer_id],params[:formanswer_id])   
         if @getAnswer.empty?
            @questionCounter = true
            @answer = Studanswer.new do |a|
              a.answer_id = params[:answer_id]
              a.formanswer_id = params[:formanswer_id]
            end
            @answer.save
         else 
           @getAnswer.first.destroy
         end
   @getsections = Section.where("form_id = ?", @getAnswer.first.answer.question.section.form_id)
   update_form_settings( @getsections ,params[:formanswer_id])
    @answer_count = get_current_count_status(@getAnswer.first.answer.question.section_id, @getAnswer.first.formanswer_id)
    respond_to do |format|
      format.js
    end
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
  
  def save_ansForSubs
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
      @getsections = Section.where("form_id = ?", @getQuestionAnswers.first.question.section.form_id)
      update_form_settings( @getsections ,params[:formanswer_id])
      @answer_count = get_current_count_status(@getQuestionAnswers.first.question.section_id, params[:formanswer_id])
    respond_to do |format|
      format.js
    end
  end
  
  def save_subAns
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
      @getsections = Section.where("form_id = ?", @getAnswer.first.subanswer.answer.question.section.form_id)
      update_form_settings( @getsections ,params[:formanswer_id])
      @answer_count = get_current_count_status(@getAnswer.first.subanswer.answer.question.section_id, params[:formanswer_id])
    respond_to do |format|
      format.js
    end
  end
  
  def save_subQuestionAns
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
     
      @getsections = Section.where("form_id = ?", @getAnswer.first.subquestionanswer.subquestion.answer.question.section.form_id)
      update_form_settings( @getsections ,params[:formanswer_id])     
     @answer_count = get_current_count_status(@getAnswer.first.subquestionanswer.subquestion.answer.question.section_id, params[:formanswer_id])
    respond_to do |format|
      format.js
    end
  end
  
  def save_complete_survey
    @formanswer = Formanswer.find(params[:formanswer_id])
    
    @studAnswer = Studanswer.where("formanswer_id = ?", params[:formanswer_id])
    @studSubAnswer = Studsubanswer.where("formanswer_id = ?", params[:formanswer_id])
    @studSubQuestionAnswer = Studsubquestionanswer.where("formanswer_id = ?", params[:formanswer_id])
    
    
    @studAnswer.each do |ans|
      @tempAnswer = Answer.new
      @tempAnswer = ans.answer
      @value = @tempAnswer.AnswerCount + 1
      @tempAnswer.update_attributes(:AnswerCount => @value)
         
    end
    
     @studSubAnswer.each do |ans|
      @tempAnswer = Subanswer.new
      @tempAnswer = ans.subanswer
      @value = @tempAnswer.SACount + 1
      @tempAnswer.update_attributes(:SACount => @value)
         
    end
    
     @studSubQuestionAnswer.each do |ans|
      @tempAnswer = Subquestionanswer.new
      @tempAnswer = ans.subquestionanswer
      @value = @tempAnswer.SQAnswerCount + 1
      @tempAnswer.update_attributes(:SQAnswerCount => @value)
         
    end
    
    @formanswer.update_attributes(:FormStatus => "Completed")
     ## compelte it here
  end
    
    
    #-------------------------------------------------------------------------------#
    #---------------------------------- USER SIDE-----------------------------------#
    #-------------------------------------------------------------------------------#
  
  
  #------------------------------------------------------------------------------------#
  #---------------------------------- FORM ANSWERING ----------------------------------#
  #------------------------------------------------------------------------------------#
  
  
  
  #------------------------------------------------------------------------------------#
  #---------------------------------- FORM CREATION -----------------------------------#
  #------------------------------------------------------------------------------------#
  

  def create_survey
    @form = Form.new
  end
  
  def submit_create_survey
    @form = Form.new(form_params)
    @form.FormDateTime = Time.now
    @form.FormStatus = 'Not Published'
    @form.user_id = current_user.id     #current_user.id 

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
   
  def create_render_existing_question
    @getQuestions = Question.all
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
      
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end
    end
    
    def create_subanswer_remove
      @subAnswer = Subanswer.find(params[:subAns_id]).destroy
      
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end      
    end
    
    def create_subquestion_remove   
      @subQ = Subquestion.where("id = ?", params[:subQuest_id]).destroy_all
      
      @getQuestions = Question.where("section_id = ?", params[:selected_section_id]) 
      
      respond_to do |format|
        format.js
      end      
    end
    
    def create_subquestionanswer_remove
      
      @subQAnswer = Subquestionanswer.find(params[:subQuestAns_id])
      @subQAnswer.delete      
      
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
    
  
  #------------------------------------------------------------------------------------#
  #---------------------------------- FORM CREATION -----------------------------------#
  #------------------------------------------------------------------------------------#
  
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
    @form.FormStatus = 'Not Published'
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
  
  
#---------------------------------- -------------------------------------------------#
#---------------------------------- FORM ANSWERING ----------------------------------#
#---------------------------------- -------------------------------------------------#
 def create_studanswer
   @studanswer = Studanswer.new(studanswer_params)
 end
 def create_studsubanswer
   @studsubanswer = Studsubanswer.new(studsubanswer_params) 
 end
 def create_studsubquestionanswer
   @studsubquestionanswer = Studsubquestionanswer.new(studsubquestionanswer_params)   
 end
#---------------------------------- -------------------------------------------------#
#---------------------------------- FORM ANSWERING ----------------------------------#
#---------------------------------- -------------------------------------------------#



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
    #---------------------------------- -------------------------------------------------#
    #---------------------------------- FORM ANSWERING ----------------------------------#
    #---------------------------------- -------------------------------------------------#
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
    
    def formassociate_params
      params.require(:formassociate).permit( :yearofstudy_id, :levelofstudy_id, :faculty_id, :programme_id, :agefrom, :agecondition)
    end
    
    def obtain_question
      if params[:question_id] == "0"
        obtain_first_question(params[:section_id])
      else
        @question = Question.where("id = ?", params[:question_id]).first  
      end
    end
    def obtain_first_question(section_id)
      @question = Question
      .order("questions.QuestionNumber")
      .where("questions.section_id = ? AND questions.QuestionNumber = ?", section_id, 1).first  
    end
    def obtain_all_questions(section_id)
      @allQuestions = Question
      .order("questions.QuestionNumber")
      .where("questions.section_id = ?", section_id)
      
      @question_counter = @allQuestions.count
    end
    
    def check_question_answered_status(quest_id, fa_id)
      
      @answers = Answer.where(question_id: quest_id)
      
      @answers.each do |ans|
        @existingAnswer = Studanswer.where("answer_id = ? AND formanswer_id = ?", ans.id, fa_id)
        if !@existingAnswer.nil?
          return true
        end
      end      
      return false
    end  
    
    def get_current_count_status(section_id, fa_id)
      obtain_all_questions(section_id)
      @counter = 0;
        @existingAnswer = Studanswer.where(formanswer_id: fa_id)
        @existingSubAnswer = Studsubanswer.where(formanswer_id: fa_id)
        @existingSubQuestionAnswer = Studsubquestionanswer.where(formanswer_id: fa_id)
            @allQuestions.each do |sectionQuestions|  
              @existingAnswer.each do |studAns|   
                if studAns.answer.IsSubQuestion                               ### 
                  @existingSubQuestionAnswer.each do |studSubQuestAns|
                    if studSubQuestAns.subquestionanswer.subquestion.answer.question_id == sectionQuestions.id
                      @counter += 1                                           
                      break
                    end
                  end
                elsif studAns.answer.IsSubAnswer           
                  @existingSubAnswer.each do |studSubAns|##
                    if studSubAns.subanswer.answer.question_id == sectionQuestions.id
                      @counter += 1                                           
                      break
                    end
                  end                                    ##
                else                                                          ###  
                  if studAns.answer.question_id == sectionQuestions.id  ##
                    @counter += 1                                       ##    
                    break
                  end                                                   ##
                end                                                           ###                    
              end 
            end      
      #  end         
        return @counter
    end
    
    def update_form_settings( sections ,fa_id)
      @sectionArr = Array.new
      @totalQuestionArr = Array.new
      @completedQuestionArr = Array.new
      @formanswer_id = fa_id
      sections.each do |fSection|
        @sectionArr << fSection.SectionName
        @totalQuestionArr << fSection.question.count
        @completedQuestionArr << get_current_count_status(fSection.id, @formanswer_id)
      end
    end
    
    def ageCheck(user_id, form_id)
      @user_details = User.find(user_id)
       @formConstraints = Formassociate.where("form_id = ?", form_id)
      @formConstraints.each do |constraints|
          if constraints.agecondition == "All"
              return true          
          elsif constraints.agecondition == "Equal"
            if @user_details.age.to_i == constraints.agefrom
              return true
            else 
              return false
            end        
          elsif constraints.agecondition == "Less Than"
            if @user_details.age.to_i < constraints.agefrom
              return true
            else 
              return false
            end          
          elsif constraints.agecondition == "More Than"
            if @user_details.age.to_i > constraints.agefrom
              return true
            else 
              return false
            end                    
          elsif constraints.agecondition == "Between"
            if @user_details.age.to_i >= constraints.agefrom || @user_details.age <= constraints.ageto
              return true
            else 
              return false
            end                    
          end
        end
    end
    
    def otherChecks(user_id, form_id)
       @user_details = User.find(user_id)
       @formConstraints = Formassociate.where("form_id = ?", form_id)
        @formConstraints.each do |constraints|#
          if constraints.faculty.facultyname == "All"##             
              return true         
          elsif constraints.faculty_id == @user_details.faculty_id##
            if constraints.levelofstudy.levelname == "All"###            
             return true
            elsif constraints.levelofstudy_id == @user_details.levelofstudy_id###
              if constraints.yearofstudy.year == "All"####
                return true
              elsif constraints.yearofstudy_id ==  @user_details.yearofstudy_id####
                if constraints.programme.programmename = "All"#####
                  return true
                elsif constraints.programme_id = @user_details.programme_id#####
                  return true                  
                end#####               
              end####
            end###
          else##
            return false
          end##
        end#
        return false
    end
    #---------------------------------- -------------------------------------------------#
    #---------------------------------- FORM ANSWERING ----------------------------------#   
    #---------------------------------- -------------------------------------------------#
end
