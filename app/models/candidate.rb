class Candidate < ApplicationRecord

    belongs_to :job
    mount_uploader :cv, AttachmentUploader

    def send_mail_interview
        # InterviewMailer.send_mail_interview(self).deliver_now
        UserMailer.make_an_appointment(self).deliver_now
    end
    
    def send_mail_to_offer
        UserMailer.mail_to_offer(self).deliver_now
    end
end
