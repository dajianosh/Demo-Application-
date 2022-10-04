class InterviewMailer < ApplicationMailer
  
  def interview_mail_to_employee
    @interview = params[:interview]
    mail(to: @interview.employee.email, subject: 'Interview Scheduled')
  end
  
  def interview_mail_to_candidate
    @interview = params[:interview]
    mail(to: @interview.candidate.email, subject: 'Interview Invite')
  end  
end
