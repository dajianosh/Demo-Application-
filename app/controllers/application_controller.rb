class ApplicationController < ActionController::Base

  before_action :set_current_employee
  
  def set_current_employee
    # finds employee with session data and stores it if present
    Current.employee = Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end
end
