class SessionsController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token

    def create 
        user = User.find_by(username: params[:username].downcase)
            if user && user.authenticate(params[:password])
                log_in user
                params[:remember_me]=='1' ? remember(user) : forget(user)
                redirect_to root_path
            else
                flash[:danger] = "Invalid username/password combination"
                redirect_to login_path
            end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to login_url
    end

end
