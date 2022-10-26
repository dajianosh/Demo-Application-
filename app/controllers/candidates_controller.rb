class CandidatesController < ApplicationController
  before_action :check_employee_role
  before_action :set_candidate, only: %i[show edit update destroy]

  def index
    @candidates = Candidate.all
  end
  
  def show; end

  def new
    @candidate = Candidate.new
  end
  
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path
    else
      render :new
    end
  end

  def edit; end
  
  def update
    if @candidate.update(candidate_params)
      redirect_to candidate_path
    else
      render :edit
    end  
  end  

  def destroy
    @candidate.destroy!
    respond_to do |format|
      format.js 
    end
  end  
  
  private
  def candidate_params
    params.require(:candidate).permit(:email, :name, :address, :contact_number, :experience, :profile_photo, skill_ids: [])
  end  

  def check_employee_role
    redirect_to employee_path(current_employee), notice:'This feature is limited to only HRs' unless current_employee.role == "HR"
  end  

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end  
end
