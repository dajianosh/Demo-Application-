class SkillsController < ApplicationController
  before_action :check_employee_role

  def index
    redirect_to new_skill_path
  end 

  def new
    @skill = Skill.new
  end 
  
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to current_employee
    else
      render :new
    end  
  end  

  private
  def skill_params
    params.require(:skill).permit(:name)
  end  

  def check_employee_role
    redirect_to employee_path(current_employee), notice:'This feature is limited to only HRs' if current_employee.role == "Resource"
  end  
  
end
