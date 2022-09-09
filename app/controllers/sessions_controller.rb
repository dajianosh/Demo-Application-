class SessionsController < ApplicationController
  
  def new; end
  
  def create
    @employee = Employee.find_by(email: params[:email]) 
    if @employee.present? && @employee.authenticate(params[:password])
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee.id), notice: 'Logged in Succesfully'
    else 
      flash[:alert] = 'Invalid email or password'
      redirect_to request.referrer
    end  
  end
   
  def destroy
    session[:employee_id] = nil
    redirect_to new_session_path, notice: "Logged out "
  end 
    
end
