class HomeController < ApplicationController
    layout false
    def index
        @about = About.first
        @jobs = Job.select_job_to_view.page(params[:page]).per(8)
        @news = News.where(:checked=>true).page(params[:page]).per(2)     
        render 'index'
    end
end
