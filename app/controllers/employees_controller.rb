class EmployeesController < ApplicationController
  before_action :require_employee_logged_in!, only: :show

  def index
    redirect_to new_employee_registration_path
  end 

  def show; end  
   
  def edit; end
  
  def update
    if current_employee.update(employee_params)
      redirect_to employee_path(current_employee.id)
    else
      render :edit  
    end  
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience, :profile_photo, skill_ids: [])
  end

  private
  def require_employee_logged_in!
    redirect_to root_path, notice: 'You must be signed in' if current_employee.nil?
  end
end
