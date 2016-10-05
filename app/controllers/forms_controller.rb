class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

helper_method :obtain_question

  def newIndex
    @forms = Form.all
      #this can remove later test retrieve first
    @sections = Section.all 
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
    @sections = Section.where("form_id = ?", params[:formId])
    
    #@bigValue = Subanswer.joins(answers:   [{   questions: :subquestions    }   ])
    
    @questions = Section
    .select("questions.id as qId ,questions.QuestionDesc, questions.QuestionNumber , sections.id as sId , sections.SectionName , sections.SectionDescription")
    .joins( :question)
    .where( "form_id= ?" , params[:formId])
 
 
# select *
# from answers a
# left join questions q on a.question_id = q.id
# left join sections s on q.section_id = s.id
# SELECT answers.* FROM answers
#  INNER JOIN questions ON question.answer_id = a.id
#  INNER JOIN sections ON sections.question_id = question.id
#  == Answers.joins(question: :section)
  
    @answers = Answer
    .select("section.form_id as form_id, answer.AnswerDesc , answer.isSubAnswer")
    .joins( (:question, (question: :section) )
    .where( "form_id = ?", params[:formId])
   # @formSections = Section.where("form_id = ? ", params[:formId])

         
   # @getQuestion = Section.joins( :question ).where( "form_id= ?" , params[:formId])
  
  end
  
  def obtain_question(sectionId)
    @questions = Question.where("section_id = ?", sectionId)
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
