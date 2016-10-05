class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)  do |user_params|
      user_params.permit({ roles: [] },  :email, :name, :ICNo ,:age , :programme, :password, :password_confirmation)
    end

  #devise_parameter_sanitizer.for(:account_update) << :name
  end

  helper_method :current_user

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

end
