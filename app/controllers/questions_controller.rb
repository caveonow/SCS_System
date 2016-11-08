class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]



  def new_create
    @question = Question.new
  end

  def submit_create
    @question = Question.new(question_params)
    
    respond_to do |format|
      if @question.save
        @save = true;  
       @getQuestions = Question.where("section_id = ?", @question.section_id) 
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
  def submit_create_existing
    
    
    @getQuestions = Question.where("section_id = ?", params[:section_id]) 
    
    @getQuestionToClone = Question.find(params[:question_id])
    @section = Section.find(params[:section_id]).question.count
    @count = @section += 1
    @subQuestion = false
    @subAnswer = false

    puts @questionCount
    @newQuestion = Question.new    
    @newQuestion.QuestionDesc = @getQuestionToClone.QuestionDesc
    @newQuestion.QuestionNumber = @count    
    @newQuestion.section_id = params[:section_id]
    @newQuestion.save
    
    @answerLoop = @getQuestionToClone.answer.count
    
    if @getQuestionToClone.answer.first.IsSubAnswer
      @subAnswer = true
    elsif @getQuestionToClone.answer.first.IsSubQuestion
      @subQuestion = true
    end
    
    @getAnswers = Answer.where("question_id = ?",@getQuestionToClone.id)
        
      @getAnswers.each do |ans|
        @duplicateAnswer = Answer.new
        @duplicateAnswer = ans.dup
        @duplicateAnswer.question_id = @newQuestion.id
        @duplicateAnswer.AnswerCount = 0
        @duplicateAnswer.save
        
        if @duplicateAnswer.IsSubAnswer
          @getSubAnswer = Subanswer.where("answer_id = ?", ans.id)
          @getSubAnswer.each do |subAns|
            @duplicateSubAnswer = Subanswer.new
            @duplicateSubAnswer = subAns.dup
            @duplicateSubAnswer.answer_id = @duplicateAnswer.id
            @duplicateSubAnswer.SACount = 0
            @duplicateSubAnswer.save
          
          end
          
        elsif @duplicateAnswer.IsSubQuestion
          @getSubQuestion = Subquestion.where("answer_id = ?", ans.id)
          @getSubQuestion.each do |subQuestion|
            @duplicateSubQuestion = Subanswer.new
            @duplicateSubQuestion = subQuestion.dup
            @duplicateSubQuestion.answer_id = @duplicateAnswer.id
            @duplicateSubQuestion.save       
                
            @getSubQuestionAnswer = Subquestionanswer.where("subquestion_id = ?", subQuestion.id)
            @getSubQuestionAnswer.each do |subQuestionAnswer|
              @duplicateSubQuestionAns = Subquestionanswer.new
              @duplicateSubQuestionAns = subQuestionAnswer.dup
              @duplicateSubQuestionAns.SQAnswerCount = 0
              @duplicateSubQuestionAns.subquestion_id = @duplicateSubQuestion.id
              @duplicateSubQuestionAns.save
            end
          end
        end
      end
      
      respond_to do |format|
        format.js
      end
    #render  :nothing => true
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:QuestionDesc, :QuestionNumber, :section_id)
    end
end
