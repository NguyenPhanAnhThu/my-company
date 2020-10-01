class InterviewMailer < ApplicationMailer
    def send_mail_interview(candidate)
        @candidate = candidate

        mail(to: @candidate.email, subject: "Interview letter - EgdeWorks Company")
    end
end
