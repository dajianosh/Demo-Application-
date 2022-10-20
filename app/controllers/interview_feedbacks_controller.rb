class InterviewFeedbacksController < ApplicationController
  before_action :find_interview, only: %i[edit update show destroy]
  before_action :find_feedback_and_answer_ratings, only: %i[show edit update destroy]

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
  
  private

  def interview_feedback_params
    params.require(:interview_feedback).permit(:skill_rating, :soft_skill_rating, :final_rating, :interview_id, interview_answer_ratings_attributes: [:id, :question_bank_id, :answer, :rating, :_destroy])
  end  

  def find_interview
    @interview = Interview.find_by(id: params[:interview_id])
  end

  def find_feedback_and_answer_ratings
    @interview_feedback = @interview.interview_feedback
    @interview_answer_ratings = @interview_feedback.interview_answer_ratings
  end  
end
