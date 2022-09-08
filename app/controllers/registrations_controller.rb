class RegistrationsController < ApplicationController
  
  before_action :require_employee_logged_in!, only: :show
  
  def index; end  
  #creating new employee and saving it to the database
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to sign_in_path, notice: 'Succesfully created employee'
    else
      render :new
    end    
  end

  def show
    @employee = Employee.find_by(params[:id])
  end  
  
  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :name, :role, :address, :contact_number, :experience)
  end

  def require_employee_logged_in!
    # allows only logged in employee
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.employee.nil?
  end
  
end
