class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    add_flash_types :info, :error, :warning

    private

        # Confirm a logged-in user
        def logged_in_user
            unless logged_in?
                store_location
                flash[:warning] = "Please Login."
                redirect_to login_url
            end
        end
end
