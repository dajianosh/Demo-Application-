# Preview all emails at http://localhost:3000/rails/mailers/interview_mailer
class InterviewMailerPreview < ActionMailer::Preview
  def interview_mail_to_employee
    # Set up a temporary order for the preview
    employee = Employee.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", contact_number: "090-7777-8888", role:"Resource", experience:2)

    InterviewMailer.with(employee: employee).interview_mail_to_employee
  end

  def interview_mail_to_candidate
    # Set up a temporary order for the preview
    candidate = Candidate.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", contact_number: "090-7777-8888", experience:0)

    InterviewMailer.with(candidate: candidate).interview_mail_to_candidate
  end
end
