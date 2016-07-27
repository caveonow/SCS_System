class SessionsController < ApplicationController
  def new
  end
  
  def create
    @student = Student.find_by_StudentEmail(params[:session][:email])
    if @student && @student.authenticate(params[:session][:password])
      session[:id] = @student.id
      redirect_to root_url 
    else
      redirect_to root_url 
    end 
  end
  
  def destroy 
    session[:id] = nil 
    redirect_to root_url 
  end

end
