class AboutsController < ApplicationController
    def index
        @about = About.first
        
    end   
    def new
        @about = About.new
    end
    def edit
        @about = About.first
    end

    def update
        @about = About.find_by_id(1)
        if @about.update(about_params)
            flash[:success] = "Update Success"
        else
            flash[:error] = "Have some error!"
        end
        redirect_back fallback_location: root_path
    end
    private 
    def about_params
        params.require(:about).permit(:title, :content, :address, :hotline, :email, :facebook,
                                    :linkedin, :favicon, :logo)
    end

end
