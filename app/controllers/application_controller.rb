class ApplicationController < ActionController::Base
 
  def after_sign_in_path_for(resource)
    employee_path(resource)
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience)
  end

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience)}
  end

end
