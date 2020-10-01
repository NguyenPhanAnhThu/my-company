module SessionsHelper
    # Login the given user
    def log_in user
        session[:user_id] = user.id
    end

    #Remembers a user in a persistent session
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    # Return true if the given user is the current user
    def current_user?(user)
        user == current_user
    end

    # Returns the user corresponding to the remember token cookie
    def current_user
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        
        end
    end
    # Returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end

    # Forgets a persitent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    # def logged_in?
    #     if current_user
    #         render json: {
    #             logged_in: true,
    #             user: current_user
    #         }
    #     else
    #         render json:{
    #             logged_in: false
    #         }
    #     end
    # end
    # Logout the current user.
    def log_out
        session.delete :user_id
    end

    # Stores the URL trying to be accessed
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
