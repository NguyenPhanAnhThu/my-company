class LevelController < ApplicationController
    before_action :logged_in_user

    def index
    @levels = Level.all

    end
    def new
        @level = Level.new
    end
    def create
        @level = Level.new(level_params)
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
        @level = Level.find(params[:id])
    end
    def update
        @level = Level.find(params[:id])
        if @level.update(level_params)
            flash[:success] = "Update Success"             
        else
            flash[:error] = "Cannot Update"     
        end
        redirect_back fallback_location: root_path
    end
    def destroy
        @level = Level.find(params[:id])
        if @level.delete_level
            @level.destroy
            flash[:success] = "Delete Success"
        else
            flash[:warning] = "Cannot delete this level"
        end
        @levels = Level.all
        redirect_back fallback_location: root_path
    end
    private
    def level_params
        params.require(:level).permit(:name)
    end
end
