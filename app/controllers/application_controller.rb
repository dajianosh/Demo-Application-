class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  helper_method :is_HR?

  def after_sign_in_path_for(resource)
    employee_path(resource)
  end

  def is_HR?
    current_employee.role == "HR"
  end  

  protected
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience, :profile_photo, skill_ids: []) }
  end
end
