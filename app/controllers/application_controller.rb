class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  #devise configuration
  protected
 # def configure_permitted_parameters
 #   devise_parameter_sanitizer.permit(:sign_up)  do |user_params|
  #  user_params.permit({ roles: [] },  :email, :name, :ICNo ,:age , :programme, :password, :password_confirmation)
  #  end
 # end
  
 # protected
  #def configure_permitted_parameters_update
  #  devise_parameter_sanitizer.permit(:account_update)  do |user_params|
  #  user_params.permit({ roles: [] },  :email, :name, :ICNo ,:age , :programme, :password, :password_confirmation)
  #  end
  #end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
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
  
  
end
