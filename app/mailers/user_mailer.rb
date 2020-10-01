class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  def make_an_appointment(candidate)
    @candidate = candidate
    mail to: candidate.email, subject: "Interview letter"
  end

  def mail_to_offer(candidate)
    @candidate = candidate
    mail to: candidate.email,subject: "Mail to offer"
  end
  
end
