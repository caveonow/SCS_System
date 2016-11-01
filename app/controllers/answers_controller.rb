class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]


def new_create
  @answer = Answer.all
end

   def submit_create
      @subAnsValid = false
      @subQAnsValid = false 
      @subQValid = false
      @answer = Answer.new
      @answer.AnswerDesc = params[:AnswerDesc]
      @answer.AnswerCount = params[:AnswerCount]
      @answer.question_id = params[:question_id]
      
      if params[:choice]=="IsSubQuestion"
        @answer.IsSubQuestion = 1
        @answer.IsSubAnswer = 0
        puts "is sub question"
      elsif params[:choice]=="IsSubAnswer"
        @answer.IsSubQuestion = 0
        @answer.IsSubAnswer = 1
        puts "is sub answer"
      elsif params[:choice]=="None"
        @answer.IsSubQuestion = 0
        @answer.IsSubAnswer = 0
        puts "its none"
      end
      
      if params[:SADesc_values].present?
        puts "SubAnswer ada"
        @subAnsValid = true
        @arr_SADesc = params[:SADesc_values]    
      end
      
      if params[:SQAnswer_values].present?
        puts "SubQuestionAnswer ada"
        @subQAnsValid = true 
        @arr_SQAnswer = params[:SQAnswer_values]  
      end
         
      if !params[:SQDesc].nil?
        puts "SubQuestion ada"
        @subQValid = true 
        @SADescBlank =true
      end           
      
      respond_to do |format|
              

      if @subQValid
        if params[:SQDesc].blank?
          @save = false;
          puts "fail"
        else
          if @answer.save      
            if @subQAnsValid          
              @subQuestion = Subquestion.new
              @subQuestion.SQDesc = params[:SQDesc]
              @subQuestion.SQChar = "a" ##change here ltr
              @subQuestion.answer_id = @answer.id
              @subQuestion.save
              (0..@arr_SQAnswer.size).each do |i|
              puts @arr_SQAnswer[i]
                if !@arr_SQAnswer[i].blank?            
                  @subQAnswer = Subquestionanswer.new
                  @subQAnswer.SQAnswerCount = 0
                  @subQAnswer.subquestion_id = @subQuestion.id
                  @subQAnswer.SQAnswer = @arr_SQAnswer[i]
                  @subQAnswer.save
                end
            end
          end            
            @save = true;          
            @getAnswers = Answer.where("question_id = ?", @answer.question_id) 
            @getQuestions = Question.where("section_id = ?", @answer.question.section_id)
            puts "success"
          else
            @SADescBlank = false
            @save = false;
            puts "fail"                     
          end 
        end     
      elsif !@subQValid
        if @answer.save                    
          if @subAnsValid    
            (0..@arr_SADesc.size).each do |i|
              puts @arr_SADesc[i]
              if !@arr_SADesc[i].blank?            
                @subAnswer = Subanswer.new
                @subAnswer.SACount = 0
                @subAnswer.answer_id = @answer.id
                @subAnswer.SADesc = @arr_SADesc[i]
                @subAnswer.save
              end
            end   
          end
          @save = true;                    
          @getAnswers = Answer.where("question_id = ?", @answer.question_id) 
          @getQuestions = Question.where("section_id = ?",   @answer.question.section_id)
        
          puts "success"
        else
          @save = false;
          puts "fail"
        end
      end      
      format.html
      format.json
      format.js
      end
  end
      def create_subAnswer
        respond_to do |format|
          format.js
        end
      end
      
      def create_subQuestion
        respond_to do |format|
          format.js
        end        
      end
      def remove_createSub
        respond_to do |format|
          format.js
        end        
      end
      
      def create_edit_answer_change    
        
        respond_to do |format|  
          if params[:edit_answer].blank?
            @save = false
          else
            @save = true
            @updateAnswer = Answer.find(params[:ans_id])
            @updateAnswer.update_attributes(:AnswerDesc => params[:edit_answer])
            
            @getQuestions = Question.where("section_id = ?", @updateAnswer.question.section_id)
          end
          format.js
        end           
      end
      
      def create_edit_subanswer_change
        respond_to do |format|  
          if params[:edit_answer].blank?
            @save = false
          else
            @save = true
            @updateAnswer = Answer.find(params[:ans_id])
            @updateAnswer.update_attributes(:AnswerDesc => params[:edit_answer])              
            if params[:SADesc_values].present?      
              @arr_SADesc = params[:SADesc_values]  
                (0..@arr_SADesc.size).each do |i|
                  puts @arr_SADesc[i]
                  if !@arr_SADesc[i].blank?            
                    @subAnswer = Subanswer.new
                    @subAnswer.SACount = 0
                    @subAnswer.answer_id = @updateAnswer.id
                    @subAnswer.SADesc = @arr_SADesc[i]
                    @subAnswer.save
                  end
                end      
            end     
                                   
            @getQuestions = Question.where("section_id = ?", @updateAnswer.question.section_id)
          end
          format.js
        end               
      end

      def create_edit_subanswers_change

        respond_to do |format|  
        if params[:edit_answer].blank?
          @save = false
        else
          @save = true
          @updateAnswer = Subanswer.find(params[:subAns_id])   
          
          @updateAnswer.update_attributes(:SADesc => params[:edit_answer])  
          @getQuestions = Question.where("section_id = ?", @updateAnswer.answer.question.section_id)
          
        end  
          format.js
        end
      end
      
      def create_edit_answer_subquestion_change
       
        @subQValid = false
        @SADescBlank = false
        
        if params[:SQAnswer_values].present?
            puts "SubQuestionAnswer ada"
            @subQAnsValid = true 
            @arr_SQAnswer = params[:SQAnswer_values]  
        end   
        if !params[:SQDesc].nil?
          puts "SubQuestion ada"
          @subQValid = true 
          @SADescBlank = true
        end           
        
        respond_to do |format|
           if params[:edit_answer].blank?
                @save = false
                if !params[:SQDesc].blank?
                  @SADescBlank = false
                end
           else
              @answer = Answer.find(params[:ans_id])  
                puts "edit answer is not blank = true"
                
              if @subQValid
                puts "subQvalid = true"
                if params[:SQDesc].blank?
                    @save = false;
                    @SADescBlank =true
                else
                    @subQuestion = Subquestion.new
                    @subQuestion.SQDesc = params[:SQDesc]
                    @subQuestion.SQChar = "a" ##change here ltr
                    @subQuestion.answer_id = @answer.id
                    @subQuestion.save
                    if @subQAnsValid          
                      (0..@arr_SQAnswer.size).each do |i|
                        if !@arr_SQAnswer[i].blank?            
                          @subQAnswer = Subquestionanswer.new
                          @subQAnswer.SQAnswerCount = 0
                          @subQAnswer.subquestion_id = @subQuestion.id
                          @subQAnswer.SQAnswer = @arr_SQAnswer[i]
                          @subQAnswer.save
                        end
                      end
                   puts "subqans ADDED +++"
                    end
                puts "theres subQ and it runs "
                   @answer.update_attributes(:AnswerDesc => params[:edit_answer]) 
                  @getQuestions = Question.where("section_id = ?", @answer.question.section_id)  
                   @save = true
                end
              else        
                puts "subQvalid = false"     
                @save = true
                @answer.update_attributes(:AnswerDesc => params[:edit_answer])
                @getQuestions = Question.where("section_id = ?", @answer.question.section_id)  
              end
           end
          format.js
        end     
      end
      
      def create_subQuestionAnswer_change #for create_edit_subquestion_change
        respond_to do |format|
          format.js
        end            
      end
      
      def create_edit_subquestion_change

        respond_to do |format|  
          if params[:edit_answer].blank?
            @save = false
          else
            @save = true
            @updateAnswer = Subquestion.find(params[:subQuestAns_id])
            @updateAnswer.update_attributes(:SQDesc => params[:edit_answer]) 
                         
            if params[:SQAnswer_values].present?   
              @arr_SQAnswer = params[:SQAnswer_values] 
               (0..@arr_SQAnswer.size).each do |i|
              puts @arr_SQAnswer[i]
                if !@arr_SQAnswer[i].blank?            
                  @subQAnswer = Subquestionanswer.new
                  @subQAnswer.SQAnswerCount = 0
                  @subQAnswer.subquestion_id = @updateAnswer.id
                  @subQAnswer.SQAnswer = @arr_SQAnswer[i]
                  @subQAnswer.save
                end
              end
            end                                        
            @getQuestions = Question.where("section_id = ?", @updateAnswer.answer.question.section_id)
          end
          format.js
        end                       
      end
      

      def create_edit_subquestionanswers_change
        respond_to do |format|  
        if params[:edit_answer].blank?
          @save = false
        else
          @save = true
          @updateAnswer = Subquestionanswer.find(params[:subQuestAns_id])   
          
          @updateAnswer.update_attributes(:SQAnswer => params[:edit_answer])  
          @getQuestions = Question.where("section_id = ?", @updateAnswer.subquestion.answer.question.section_id)
          
        end  
          format.js
        end        
      end




#-----------------------------------------------------------------------------------------------------

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

          def subanswer_params
      params.require(:subanswer).permit(:SubAnswerDesc, :SubAnswerCount)
    end


    def answer_params
      params.require(:answer).permit(:AnswerDesc, :AnswerCount, :question_id)
    end




end
