class ProjectController < ApplicationController
    before_action :logged_in_user

    def index
        @customers = Project.all
    end

    def new
        @customer = Project.new
    end

    def create
        @customer = Project.new(project_params)
        if @level.save
            flash[:success] = "Add Success"
            @levels = Level.all
            render 'index'  
        else
            flash[:error] = "Have some error"
            redirect_to root_url   
        end
    end

    def edit
        @customer = Project.find(params[:id])
    end

    def update
        @customer = Project.find(params[:id])
        if @customer.update(project_params)
            flash[:success] = "Update Success"
        else
            flash[:error] = "Cannot Update"
        end
        redirect_back fallback_location: root_path
    end

    def destroy
        @customer = Project.find(params[:id])
        if @customer.destroy
            flash[:success] = "Delete Success"
        else
            flash[:warning] = "Cannot delete this project"
        end
    end
    private 
    def project_params
        params.require(:project).permit(:link, :img)
    end
end
