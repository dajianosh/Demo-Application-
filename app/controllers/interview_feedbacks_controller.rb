class InterviewFeedbacksController < ApplicationController
  before_action :find_interview, only: %i[new edit update show index destroy]
  before_action :find_feedback_and_answer_ratings, only: %i[show edit update destroy]

  def index
    redirect_to  new_interview_interview_feedback_path(@interview.id)
  end

  def new
    @interview_feedback = @interview.build_interview_feedback
  end
  
  def create
    @interview = Interview.find(params[:interview_feedback][:interview_id])
    @interview_feedback = @interview.create_interview_feedback(interview_feedback_params)
    @interview.update(completed_time: params[:interview_feedback][:completed_time])
    if @interview_feedback.save
      @interview_answer_ratings = @interview_feedback.interview_answer_ratings
      redirect_to interview_interview_feedback_path(@interview.id, @interview_feedback.id, @interview_answer_ratings.ids)
    else
      render :new  
    end  
  end

  def show; end  
  
  def edit; end
  
  def update
    @interview = Interview.find(params[:interview_feedback][:interview_id])
    if @interview_feedback.update(interview_feedback_params)
      @interview.update(completed_time: params[:interview_feedback][:completed_time])
      redirect_to interview_interview_feedback_path(@interview.id, @interview_feedback.id, @interview_answer_ratings.ids)
    else
      render :edit
    end  
  end

  def destroy
    if @interview_feedback.destroy
      @interview.update(completed_time: nil)
      redirect_to interviews_path
    else 
      flash[:notice] = "Could not delete interview feedback"
    end  
  end  
  
  private

  def interview_feedback_params
    params.require(:interview_feedback).permit(:skill_rating, :soft_skill_rating, :final_rating, :interview_id,
       interview_answer_ratings_attributes: [:id, :question_bank_id, :answer, :rating, :_destroy])
  end  

  def find_interview
    @interview = Interview.find(params[:interview_id])
  end

  def find_feedback_and_answer_ratings
    @interview_feedback = InterviewFeedback.find_by(id: params[:id])
    @interview_answer_ratings = @interview_feedback.interview_answer_ratings
  end  
end
