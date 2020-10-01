class RecruitmentController < ApplicationController
    layout false
    def index
        @about = About.first
        @jobs = Job.select_job_to_view.page(params[:page]).per(8)
    end
    def show
        @recruitment = Job.find(params[:id])
        @recruitment[:views] = @recruitment[:views] + 1
        @recruitment.save
        @about = About.first
        # @recruitment[:descriptions]=@recruitment[:descriptions].split("\n")
        # @print = @recruitment[:descriptions].map { |i| "Random text #{i}" }
    end


end
