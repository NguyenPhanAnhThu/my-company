class SendMailToCandidateController < ApplicationController
    before_action :get_candidate
    def index 

    end
    def
    def new
    end

    def show
        
    end
    def create
        @candidate = Candidate.find_by(email: params[:send_mail_to_candiate][:email].downcase)
        if @candidate
            @candidate.send_mail_interview
            flash[:info] = "Sent mail"
            redirect_to root_url
        end
    end

    def get_candidate
        @candidate = Candidate.find_by(email: params[:email])
    end
end
