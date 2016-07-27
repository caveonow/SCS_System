class SessionsController < ApplicationController
  def new
  end
  
  def create
    @student = Student.find_by_StudentEmail(params[:session][:email])
    #if @student && @student.authenticate(params[:session][:password])
      #session[:user_id] = @student.id
      redirect_to 'http://localhost:3000/students#'
    #else
     # redirect_to 'login'
    #end 
  end
  
  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end

end
