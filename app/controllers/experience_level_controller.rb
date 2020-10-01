class ExperienceLevelController < ApplicationController
    before_action :logged_in_user

    def index
        @exps = ExperienceLevel.all
    end
    def new
        @exp = ExperienceLevel.new 
    end
    def create
        @exp = ExperienceLevel.new(exp_params)
        if @exp.save
            flash[:success] = "Add Success"
            @exps = ExperienceLevel.all
            render 'index'
        else
            flash[:error] = "Have some error"
            redirect_to root_url
        end
    end

    def edit
        @exp = ExperienceLevel.find(params[:id])
    end
    def update
        @exp = ExperienceLevel.find(params[:id])
        if @exp.update(level_params)
            flash[:success] = "Update Success"             
        else
            flash[:error] = "Cannot Update"     
        end
        redirect_back fallback_location: root_path
    end
    def destroy
        @exp = ExperienceLevel.find(params[:id])
        if @exp.delete_exp_level
            @exp.destroy
            flash[:success]= "Delete Success"
        else
            flash[:warning] = "You cannot delete this Experience Level!"
        end
        @exps = ExperienceLevel.all
        redirect_back fallback_location: root_path
    end
    private 
    def exp_params
        params.require(:experience_level).permit(:name)
    end
end
