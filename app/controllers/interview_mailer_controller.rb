class InterviewMailerController < ApplicationController
    def new

    end
    def create
        @candidate = Cadidate.find_by(params[:id])
        if(@candidate)
            @candidate.send_mail_interview
            redirect_to root_url
        else
            redirect_to root_url
        end
    end
end
