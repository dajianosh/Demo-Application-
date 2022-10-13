class InterviewsController < ApplicationController
  before_action :check_employee_role, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_interview, only: %i[edit update destroy]

  def index
    if is_HR?
      @interviews = current_employee.created_interviews
    else
      @upcoming_interviews = upcoming_interviews
      @completed_interviews = completed_interviews
      @pending_interviews = pending_interviews
    end
  end

  def new
    @interview = current_employee.created_interviews.new
  end
  
  def create
    @interview = current_employee.created_interviews.new(interview_params)
    if @interview.save
      InterviewMailer.with(interview: @interview).interview_mail_to_employee.deliver_later
      InterviewMailer.with(interview: @interview).interview_mail_to_candidate.deliver_later
      redirect_to interviews_path
    else
      render :new
    end
  end

  def edit; end
  
  def update
    if @interview.update(interview_params)
      redirect_to interviews_path
    else
      render :edit
    end    
  end
  
  def destroy
    if @interview.destroy
      redirect_to interviews_path
    else
      flash[:notice] = "Could not delete interview"
    end  
  end
  
  private
  def interview_params
    params.require(:interview).permit(:date, :start_time, :completed_time, :mode, :link, :employee_id, :candidate_id)
  end

  def check_employee_role
    redirect_to employee_path(current_employee), notice:'This feature is limited to only HRs' unless is_HR?
  end  

  def find_interview
    @interview = current_employee.created_interviews.find_by(id: params[:id])
    if @interview.blank?
      flash[:notice] = "You tried to access someone else's interview"
      redirect_to interviews_path
    end  
  end

  def upcoming_interviews
    current_employee.interviews.where("scheduled_at >= ?", Time.now)
  end  
  
  def completed_interviews
    current_employee.interviews.where.not(completed_time: [nil, ""])
  end  

  def pending_interviews
    current_employee.interviews.where("scheduled_at < ? AND completed_time IS NULL", Time.now)
  end  
end
