class JobsController < ApplicationController
    before_action :logged_in_user

    def index
        @job = Job.all
        
    end
    def new       
       @job = Job.new
    end
    def show
        job_id = Job.find(params[:id])
        @job = Job.select_candidate_of_job(job_id).order(:status,:id)
       
    end
    def edit 
        @job = Job.find(params[:id])
    end
    def create
        @job = Job.new(job_params)
       if @job.save
           flash[:success] = "Add Success"
           render 'new'  
       else
           flash[:error] = "Have some error"
           redirect_to root_url                    
       end
    end
    def update
        @job = Job.find(params[:id])
        if @job.update(job_params)
            render 'edit'     
        else
            render 'edit'
        end
    end

    def destroy
        @job = Job.find(params[:id])
        if @job.delete_job
            @job.destroy 
            flash[:success] = "Delete Success"
        else
            flash[:warning] = "Cannot delete this job!"
        end
        @jobs = Job.all
        redirect_back fallback_location: root_path
    end
    def send_mail
        @candidate = Candidate.find(params[:id])
        @candidate.send_mail_interview
        @candidate[:status] = 2
        @candidate.save
        redirect_back fallback_location: root_path
    end

    def send_mail_to_offer
        @candidate = Candidate.find(params[:id])
        @candidate.send_mail_to_offer
        @candidate[:status] = 3
        @candidate.save
        redirect_back fallback_location: root_path
    end
    private    
        def job_params
            params.require(:job).permit(:name, :salary, :expiration_date, :level_id, :type_of_job_id, :descriptions, :status, :experience_level_id, :benifits, :experience)
        end
end
