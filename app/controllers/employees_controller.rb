class EmployeesController < ApplicationController
  
  before_action :require_employee_logged_in!, only: :show

  def index
    redirect_to edit_employee_registration_path
  end 

  def show
    @employee = Employee.find_by(id: params[:id])
  end  
  
  def edit
    @employee = Employee.find_by(id: params[:id])
  end
  
  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(employee_params)
      redirect_to employee_path(@employee.id)
    else
      render :edit  
    end  
  end
  private
  def require_employee_logged_in!
    redirect_to root_path, notice: 'You must be signed in' if current_employee.nil?
  end
end
