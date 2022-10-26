class SendMailJob < ApplicationJob
  queue_as :default

  def perform(interview)
    InterviewMailer.with(interview: interview).interview_mail_to_employee.deliver
    InterviewMailer.with(interview: interview).interview_mail_to_candidate.deliver
  end
end
