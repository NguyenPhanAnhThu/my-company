class CandidatesController < ApplicationController
    def index
        @candidate = Candidate.order(:status,:id).all.page(params[:page]).per(10)
        
    end
    def new 
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)    
            if @candidate.save
                job = Job.find_by(params[:job_id])
                job[:qty_apply] = job[:qty_apply] + 1
                job.save
                flash[:success] = "Thanks you for apply. We will contact you as soon as posible"
                redirect_back fallback_location: root_path
            else
                flash[:error] = "Have some error"
                redirect_back fallback_location: root_path
            end  
    end
    def edit
        @candidate = Candidate.find(params[:id])
    end

    def update
        @candidate = Candidate.find(params[:id])
        if @candidate.update(candidate_params)
            flash[:success] = "Update Success"             
        else
            flash[:error] = "Cannot Update"     
        end
        redirect_back fallback_location: root_path
    end
    def destroy
        @candidate = Candidate.find(params[:id])
        @candidate.destroy
        flash[:success]= "Delete Success"
        redirect_to @candidate
    end
    private 
        def candidate_params
            params.require(:candidate).permit(:name, :email, :phone, :cv, :note, :job_id, :date_to_interview, :status, :date_to_offer)
        end
end
