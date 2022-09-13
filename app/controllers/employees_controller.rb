class EmployeesController < ApplicationController
  before_action :require_employee_logged_in!, only: :show

  def index; end 

  def show
    @employee = Employee.find_by(id: params[:id])
  end  
  
  private
  def require_employee_logged_in!
    redirect_to new_session_path, alert: 'You must be signed in' if current_employee.nil?
  end
end
