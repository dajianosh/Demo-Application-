class ApplicationController < ActionController::Base
  helper_method :current_employee
  
  def current_employee
    @employee ||= Employee.find_by(id: session[:employee_id]) if session[:employee_id].present?
  end 

end
