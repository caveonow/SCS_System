class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

helper_method :obtain_questions , :obtain_answers, :obtain_subanswers, :obtain_subquestion , :obtain_subquestionanswer

  def newIndex
    @forms = Form.all
      #this can remove later test retrieve first
    @sections = Section.all 
  end
  
  def startForm 
    @selectedSections = Section.where("form_id = ?", params[:formId])
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
  
  # select * from questions q left join sections s on q.section_id = s.id left join forms f on f.id = s.form_id where f.id = 1;
 #select * from subanswers sa
 #left join answers a on sa.answer_id = a.id 
 #left join questions q on a.question_id = q.id
 #left join subquestions sq on a.subquestion_id = sq.id
 #left join sections s on q.section_id = s.id
 #left join forms f on s.form_id = f.id
 #where f.id = 1;
  def viewForm
    #select all sections where FORM_ID = #
    @sections = Section.where("form_id = ?", params[:formId])
    
    #@bigValue = Subanswer.joins(answers:   [{   questions: :subquestions    }   ])
   
    
    #select all question where FORM_ID = #
    @questions = Section
    .select("questions.id as qId ,questions.QuestionDesc, questions.QuestionNumber, questions.isSubQuestion ,
             sections.id as sId , sections.SectionName , sections.SectionDescription")
    .joins( :question)
    .where( "form_id= ?" , params[:formId])
 
     @subquestions = Section
    .select("sections.form_id as form_id, subquestions.SubquestionDesc as subQuest_desc, subquestions.id as id")
    .joins( :subquestion )
    .where( "form_id = ?", params[:formId])
# select *
# from answers a
# left join questions q on a.question_id = q.id
# left join sections s on q.section_id = s.id

# SELECT sections.form_id as form_id, answers.AnswerDesc , answers.isSubAnswer 
# FROM `sections` 
# INNER JOIN `questions` ON `questions`.`section_id` = `sections`.`id` 
# INNER JOIN `answers` ON `answers`.`question_id` = `questions`.`id` 
# WHERE (form_id = '1')

    @answers = Section
    .select("sections.form_id as form_id, answers.question_id as qId, answers.AnswerDesc , answers.isSubAnswer , answers.id as id")
    .joins( :answer )
    .where( "form_id = ?", params[:formId])
    
    
    @subanswers = Section
    .select("sections.form_id as form_id, subanswers.SubAnswerDesc as subAns_desc, subanswers.id as id, subanswers.answer_id as aId")
    .joins( :subanswer )
    .where( "form_id = ?", params[:formId])
    
 #   @subQuestions = Subquestion
 #   .select("subquestions.SubquestionDesc as subQ_desc, question.id as qId")
  #  .joins( :question )
   # .where("qId = ?", questionId)
   # @formSections = Section.where("form_id = ? ", params[:formId])

         
   # @getQuestion = Section.joins( :question ).where( "form_id= ?" , params[:formId])
  
  end
  
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:FormName, :FormDescription, :FormDateTime, :FormStatus, :user_id)
    end
    
end
