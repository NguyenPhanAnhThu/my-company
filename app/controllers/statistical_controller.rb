class StatisticalController < ApplicationController
    def statistics_by_job
        @sta = Job.statistics_by_job
    end

    def statistics_by_apply
        @sta = Job.statistics_by_apply
        
    end
    def statistics
        job_id = 2
    @sta = Job.statistics(job_id)
    end
end
