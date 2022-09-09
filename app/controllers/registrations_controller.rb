class RegistrationsController < ApplicationController

  def index
    redirect_to new_registration_path
  end  

  def new
    @employee = Employee.new if @employee.blank?
  end
  
  def create
    @employee = Employee.new(employee_params) 
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to new_session_path, notice: 'Succesfully created employee'
    else
      render :new
    end    
  end

  private
  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience)
  end
end
