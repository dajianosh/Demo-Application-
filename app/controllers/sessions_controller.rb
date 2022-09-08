class SessionsController < ApplicationController
  
  def new; end
  
  #login functionality for an existing employee and logging out an employee by deleting session
  def create
    #find existing employee and checks if employee can be authenticated
    @employee = Employee.find_by(email: params[:email]) 
    #setting employee_id sessions
    if @employee.present? && @employee.authenticate(params[:password])
      session[:employee_id] = @employee.id
      redirect_to employee_profile_path, notice: 'Logged in Succesfully'
    else 
      flash[:alert] = 'Invalid email or password'
      redirect_to request.referrer 
    end  
  end
  
  #deletes user session
  def destroy
    session[:employee_id] = nil
    redirect_to root_path, notice: "Logged out "
  end   
end
