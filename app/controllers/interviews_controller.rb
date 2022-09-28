class InterviewsController < ApplicationController
  before_action :check_employee_role, only: [:new, :create, :edit, :update, :destroy!]
  before_action :find_interview, only: %i[edit update destroy]

  def index
    interview_index
  end

  def new
    @interview = current_employee.created_interviews.new
  end
  
  def create
    @interview = current_employee.created_interviews.new(interview_params)
    if @interview.save
      redirect_to interviews_path
    else
      render :new
    end
  end

  def edit
    @date =  @interview.scheduled_at.strftime("%Y-%m-%d")
    @start_time = @interview.scheduled_at.strftime("%H:%M")
  end
  
  def update
    if @interview.update(interview_params)
      redirect_to interviews_path
    else
      render :edit
    end    
  end
  
  def destroy
    @interview.destroy!
    redirect_to interviews_path
  end
  
  private
  def interview_params
    params.require(:interview).permit(:date, :start_time, :completed_time, :mode, :link, :employee_id, :candidate_id)
  end

  def check_employee_role
    redirect_to employee_path(current_employee), notice:'This feature is limited to only HRs' unless current_employee.role == "HR"
  end  

  def find_interview
    @interview = Interview.find(params[:id])
  end

  def interview_index
    if current_employee.role == "HR"
      @interviews = current_employee.created_interviews
    elsif current_employee.role =="Resource"
      @interviews = current_employee.interviews
      @upcoming_interviews = []
      @completed_interviews = []
      @pending_interviews = []
      @interviews.each do |interview|
        if interview.scheduled_at > Time.now
          @upcoming_interviews << interview  
        elsif interview.completed_time.present?  
          @completed_interviews << interview
        else
          @pending_interviews << interview
        end
      end
    end
  end
end
