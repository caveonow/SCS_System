class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :obtain_questions , :obtain_answers, :obtain_subanswers, :obtain_subquestion , :obtain_subquestionanswer, :check_answer, :check_subanswer, :check_subquestionanswer
  #devise configuration
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name,:ICNo,:faculty_id,:levelofstudy_id,:yearofstudy_id,:DateOfBirth,:gender,:programme_id,:age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:name,:ICNo,:faculty_id,:levelofstudy_id,:yearofstudy_id,:DateOfBirth,:gender,:programme_id, :age])
  end
  
  helper_method :current_user 
 
  protect_from_forgery with: :exception
  
  #cancan denied unauthorized user 
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  
  private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  
  
    
    def check_answer(fa_id, ans_id)
      Studanswer.where("answer_id = ? AND formanswer_id = ?", ans_id, fa_id)
    end
    
    def check_subanswer(fa_id, subans_id)
      Studsubanswer.where("subanswer_id = ? AND formanswer_id = ?", subans_id, fa_id)
    end
    
    def check_subquestionanswer(fa_id, subquestans_id)
      Studsubquestionanswer.where("subquestionanswer_id = ? AND formanswer_id = ?", subquestans_id, fa_id)
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
 
  
  
end
